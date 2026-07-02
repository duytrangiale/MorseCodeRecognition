# Morse Code Recognition

A Verilog/FPGA digital design that turns a **Digilent Basys3** development board into a real-time Morse code input, decoding, and display device. The system samples a single push-button as a time-varying signal, classifies each press as a dot or a dash, matches the resulting pattern against a Morse code table, and renders the result on the board's LEDs and seven-segment displays.

The project is delivered as two progressively more capable Vivado designs:

| | Level 1 | Level 2 |
|---|---|---|
| Input | Single letter per session | Continuous words, up to 4 letters |
| Output | One decoded letter | Full word across all four 7-segment digits |
| Extra controls | — | East/West buttons to page through letters, dedicated Letter View switch |
| Vivado project | [`Level1/level_1.xpr`](Level1/level_1.xpr) | [`Level2/level_2.xpr`](Level2/level_2.xpr) |

## Contents

- [How it works](#how-it-works)
- [Level 1 — single character decoding](#level-1--single-character-decoding)
- [Level 2 — multi-character word decoding](#level-2--multi-character-word-decoding)
- [Architecture](#architecture)
- [Module reference](#module-reference)
- [Board I/O map](#board-io-map)
- [Getting started](#getting-started)
- [Repository layout](#repository-layout)
- [License](#license)

## How it works

Morse code encodes each letter as a sequence of short and long signals — dots and dashes. This project reproduces that encoding using the Basys3's **centre pushbutton** as the sole input transducer:

1. The user holds the button down for **less than 3 seconds** to enter a **dot**, or **3 seconds or more** to enter a **dash**.
2. Each press is timed by a 1 Hz reference ("heartbeat") counter and debounced in hardware before it reaches the decoding logic.
3. After **2 seconds** of inactivity following a press, the accumulated dot/dash sequence is compared against a built-in Morse code ROM (A–Z).
4. On a match, the decoded letter is displayed on the seven-segment display; the LEDs track which phase of the input cycle the system is currently in.
5. After **5 seconds** of inactivity in the finished state, the system automatically resets and is ready for the next character.

Both levels share this same timing discipline and the same underlying FSM/comparator/ROM pipeline — Level 2 adds a second layer of state to accumulate multiple letters into a word and to browse the result.

## Level 1 — single character decoding

- Enter one Morse sequence (up to 4 symbols) using the centre button.
- `enableDisp` (slide switch) turns the seven-segment display on/off.
- `switchDisp` toggles between two 7SD view modes:
  - **Raw view** — shows the dot/dash pattern being entered, symbol by symbol.
  - **Letter view** — shows the decoded letter once found (or a rolling "Error" indicator while no match exists).
- `enableIn` (slide switch) gates whether button presses are accepted as input.
- Onboard LEDs (`LD0`–`LD3`) indicate the current FSM phase: idle, measuring a press, translating, or ready.

## Level 2 — multi-character word decoding

Builds on Level 1's single-letter pipeline and adds:

- **Word accumulation** — up to 4 decoded letters are packed into a 20-bit word register and displayed across all four digits simultaneously.
- **Letter View mode** (`letterView` switch) — freezes the display on one letter/character slot at a time.
- **East/West navigation buttons** — page left/right through the accumulated letters (and their raw Morse patterns) once in Letter View, via a dedicated `spot` edge-detector on each button.
- The same dot/dash timing, comparator, and ROM-lookup pipeline from Level 1 is reused per character; only the display/state layer for word assembly is new.

## Architecture

Both designs follow the same signal path:

```
btn_enter ──► debouncer ──► keyProcessor ──► morseCode ──► code_comparator ──► Morse_decoder_rom
                                │                                │                    │
                                ▼                                ▼                    ▼
                              (ready)                         (found/done) ◄──────────┘
                                │                                │
                                └────────────► FSM_letter ◄──────┘
                                                    │
                                                    ▼
                                          sevenSegmentDisp / sevenSegDisp ──► ssdAnode / ssdCathode
```

- **`keyProcessor`** is a 4-state FSM (`IDLE → MEASURE → TRANSLATE → READY`) that times each button press against the 1 Hz heartbeat, classifies it as a dot (`01`) or dash (`10`), and shifts it into a 16-bit symbol buffer (`morseCode`), 2 bits per symbol, up to 4 symbols per letter.
- **`code_comparator`** walks the Morse ROM address space (a small counter-driven sequential search) comparing each entry against the assembled `morseCode` until it finds a match or exhausts the table (Z at address 28).
- **`Morse_decoder_rom`** is a combinational lookup table mapping ROM addresses 3–28 to the dot/dash encoding for A–Z.
- **`FSM_letter`** is the top-level control FSM (`IDLE → CODE_CHECK → DISP → CLOSE`) that sequences the comparator search and drives the letter display / reset lifecycle.
- **`sevenSegmentDisp`** (Level 1) / **`sevenSegDisp`** (Level 2) time-multiplexes the four 7-segment digits at 1 kHz and selects what to display based on the current mode (raw pattern, decoded letter, or full word).
- **`debouncer`** and **`heartbeat`** are shared timing primitives: the debouncer samples a button through a 3-stage shift register on a slow clock edge to reject contact bounce, and the heartbeat is a generic clock divider used everywhere a periodic tick is needed (1 Hz timing, 1 kHz display refresh, debounce sampling).
- **`spot`** (Level 2 only) is a one-shot rising-edge detector used to turn the debounced East/West signals into single pulses for letter navigation.

## Module reference

| Module | Levels | Purpose |
|---|---|---|
| `Morse_decoder_TOP` | 1, 2 | Top-level design; wires all submodules to board I/O. |
| `keyProcessor` | 1, 2 | Times button presses, classifies dot/dash, assembles the symbol sequence. |
| `code_comparator` | 1, 2 | Sequentially searches the ROM for a matching Morse pattern. |
| `Morse_decoder_rom` | 1, 2 | Combinational A–Z Morse code lookup table. |
| `FSM_letter` | 1, 2 | Top-level control FSM sequencing comparator search and display. |
| `sevenSegmentDisp` | 1 | 4-digit multiplexed 7SD driver (raw pattern / single letter). |
| `sevenSegDisp` | 2 | Extended 7SD driver supporting word view, letter view, and per-letter Morse view. |
| `debouncer` | 1, 2 | Shift-register button debouncer. |
| `heartbeat` | 1, 2 | Configurable-period clock divider ("tick" generator). |
| `waitCounter` | 1, 2 | Dual second-resolution timers (2 s / 5 s) used for inactivity timeouts. |
| `counter` | 1, 2 | Free-running address counter for the ROM search. |
| `sevenSegmentDecoder` | 1, 2 | BCD-to-seven-segment cathode pattern decoder. |
| `button_pressed` | 2 | Button-state helper for East/West navigation. |
| `spot` | 2 | Rising-edge one-shot pulse generator. |

## Board I/O map

Target board: **Digilent Basys3** (Xilinx Artix-7, `xc7a35tcpg236-1`), 100 MHz onboard oscillator. Pin constraints are defined in each level's `Basys-3-Master.xdc`.

| Signal | Direction | Level 1 pin | Level 2 pin | Function |
|---|---|---|---|---|
| `clk` | in | W5 | W5 | 100 MHz system clock |
| `btn_enter` | in | U18 | U18 | Centre button — Morse dot/dash input |
| `btn_reset` | in | U17 | U17 | Reset button |
| `btn_east` | in | — | T17 | Navigate to next letter (Letter View) |
| `btn_west` | in | — | W19 | Navigate to previous letter (Letter View) |
| `enableDisp` | in | V17 | V17 | Slide switch — enable/disable 7SD output |
| `switchDisp` | in | T1 | T1 | Slide switch — raw pattern vs. decoded view |
| `enableIn` | in | R2 | R2 | Slide switch — gate button input |
| `letterView` | in | — | U1 | Slide switch — enable per-letter browsing |
| `led[7:0]` | out | U16…V14 | U16…V14 | FSM phase / status indicators |
| `ssdCathode[7:0]` | out | W7…U7, V7 | same | Seven-segment cathodes (incl. decimal point) |
| `ssdAnode[3:0]` | out | U2, U4, V4, W4 | same | Seven-segment digit anode select |

## Getting started

1. Install **Xilinx Vivado 2019.2** (or later).
2. Open the desired project:
   - `Level1/level_1.xpr` for single-character decoding, or
   - `Level2/level_2.xpr` for multi-character word decoding.
3. Run **Synthesis → Implementation → Generate Bitstream**.
4. Connect a Basys3 board over USB and program it via Vivado Hardware Manager.
5. Operate the board:
   - Flip `enableIn` on, then hold the centre button briefly for a dot or longer (≥3 s) for a dash.
   - Wait 2 s after your last press to let the system decode; the LEDs show progress and the 7SD shows the result.
   - Toggle `switchDisp` to switch between the raw entered pattern and the decoded letter/word.
   - On Level 2, flip `letterView` and use the East/West buttons to page through the letters of the current word.
6. Testbenches (`TB_keypadProc.v`, `TB_comp_mem.v`) are available under each level's `sim_1` sources for functional simulation in Vivado's simulator.

## Repository layout

```
Level1/                     Vivado project — single-character decoder
  level_1.srcs/sources_1/   RTL sources (FSMs, comparator, ROM, display, timers)
  level_1.srcs/sim_1/       Testbenches
  level_1.srcs/constrs_1/   Basys3 pin constraints (.xdc)
  level_1.xpr                Vivado project file

Level2/                     Vivado project — multi-character word decoder
  level_2.srcs/...          Same structure as Level 1, plus word/letter-view logic
  level_2.xpr

LICENSE                     MIT License
```

## License

Released under the [MIT License](LICENSE).
