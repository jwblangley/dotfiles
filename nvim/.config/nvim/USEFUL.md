# (n)vim Tricks to remember

* `Ctrl o, Ctrl i` - go back, go forward

* `qa` - Create a macro for `a`
* `@a` - Run macro `a`
* `@@` - Run last macro
* `5@a` - Run macro `a` 5 times

* `Ctrl n, Ctrl p` - autocomplete next, autocomplete previous

* `/word` - highlight `word`
* `*` - highlight current word

* `:s/old/new/g` - replace `old` with `new` globally (on line/selection)
* `:s//new` - replace currently highlighted word with `new`

* When in visual line mode, you can run a command to filter the selection through a command. e.g. `s/old/new` or `!sort`

* `"a` - use register `a` (for yank, paste, etc.)

* `ma` - mark `a` at current position in buffer
* `mA` - mark `A` at current position in session
* `'a` - return to the line of mark `a`
* `\`a` - return to the exact position of mark `a`

* While in insert mode, use `Ctrl o` for a one-time normal mode command

* `gv` - reselect last visual mode selection

* `gc` - comment line (use with motions)

* While in a shell, use `Ctrl x Ctrl e` to open the prompt in `$EDITOR`
