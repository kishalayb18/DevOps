# Vi Editor Guide

## Introduction
Vi is a powerful text editor available on almost all Unix-based systems. This guide covers navigation, best practices, search patterns, and different modes in Vi.

---

## Modes in Vi
Vi operates in three primary modes:
1. **Normal Mode** (default) - Used for navigation and executing commands.
2. **Insert Mode** - Used for inserting and editing text.
3. **Command Mode** - Used for saving, quitting, and other operations.

### Switching Modes
- **Normal to Insert**: Press `i`, `a`, `o`, or `I`, `A`, `O`
- **Insert to Normal**: Press `Esc`
- **Normal to Command**: Press `:`
- **Command to Normal**: Press `Esc`

---

## Navigation in Vi
### Moving by Character or Line
- `h` → Move left
- `l` → Move right
- `j` → Move down
- `k` → Move up

### Moving by Word
- `w` → Move to the beginning of the next word
- `e` → Move to the end of the current/next word
- `b` → Move to the beginning of the previous word

### Moving by Line
- `0` → Move to the beginning of the line
- `^` → Move to the first non-blank character of the line
- `$` → Move to the end of the line

### Moving by Screen
- `Ctrl-d` → Move down half a screen
- `Ctrl-u` → Move up half a screen
- `Ctrl-f` → Move forward a full screen
- `Ctrl-b` → Move back a full screen

### Moving by Paragraph/Section
- `{` → Move to the beginning of the paragraph
- `}` → Move to the end of the paragraph

### Moving by Document
- `gg` → Move to the beginning of the file
- `G` → Move to the end of the file
- `:n` → Move to line `n`
- `H` → Move to the top of the screen
- `M` → Move to the middle of the screen
- `L` → Move to the bottom of the screen

---

## Searching in Vi
### Searching Patterns
- `/pattern` → Search forward for `pattern`
- `?pattern` → Search backward for `pattern`
- `n` → Repeat last search forward
- `N` → Repeat last search backward

### Searching and Replacing
- `:%s/old/new/g` → Replace all occurrences of `old` with `new`
- `:%s/old/new/gc` → Replace with confirmation
- `:.,$s/old/new/g` → Replace from current line to the last line

---

## Best Practices
1. **Use Modes Efficiently**: Avoid staying in Insert mode for long. Edit in Normal mode.
2. **Master Navigation**: Use word, paragraph, and document movements to move quickly.
3. **Leverage Search and Replace**: Use patterns and regular expressions to edit efficiently.
4. **Use Yank & Paste**:
   - `yy` to copy a line
   - `p` to paste after cursor
   - `P` to paste before cursor
5. **Undo & Redo**:
   - `u` to undo
   - `Ctrl-r` to redo
6. **Save & Exit Properly**:
   - `:w` to save
   - `:q` to quit
   - `:wq` to save and quit
   - `:q!` to quit without saving
7. **Use Registers**: `"ay` to yank into register `a` and `"ap` to paste it.

