# gx-extended.vim

Extend `gx` to use it beyond just URLs!

**Note: this plugin is still under development a lot of things may change!**

## Features

- Open anything under your cursor with several providers per file type
- Normal and visual mode support
- Providers that work together across all file types
- Fall back to the original `gx` command if all providers fail
- Implement your own providers

## Installation

Install using [vim-plug](https://github.com/junegunn/vim-plug).
Put this in your `init.vim`/`.vimrc`.

```vim
Plug 'stsewd/gx-extended.vim'
```

## Usage

Press `gx` on normal or visual mode,
the text under the cursor or the selected text will be open by a provider.

## Available providers

Providers with the `global` file type work across all file types.

### global#urls

Opens links with/without an explicit protocol.

- `google.com` will open `https://google.com`

### global#gx

Mimics the original `gx` command.

### gitcommit#github

Opens an issue/PR from a git commit message with the `#xxx` pattern.

- `Fixes #23` will open `https://github.com/user/repo/issues/23`

Note: you need to have installed [`hub`](https://github.com/github/hub) (recommended) or
[`fugitive`](https://github.com/tpope/vim-fugitive).

### markdown#link

Opens Markdown links.

- `[link](https://google.com)` will open `https://google.com`

Note: If you have [vim-markdown](https://github.com/plasticboy/vim-markdown) installed
(it's include in [polyglot](https://github.com/sheerun/vim-polyglot)),
you'll need to [disable the default key mappings](https://github.com/plasticboy/vim-markdown#disable-default-key-mappings),
since that plugin remaps `gx` by default.

### vim#plugin

Opens the GitHub page of the plugin under the cursor.

- `Plug stsewd/fzf-checkout.vim` will open `https://github.com/stsewd/fzf-checkout.vim`

## TODO

- rst?
- requirements.txt?
- Allow plugins to register their own providers?
- Write tests
- docs for reading inside vim?

## Mappings

If you don't define these mappings, `gx` is used by default.

```vim
nmap gx <Plug>(gxext-normal)
vmap gx <Plug>(gxext-visual)
```

## Settings

Default values are shown in the code blocks.

### g:gxext#custom_providers

Dictionary of custom providers (`language#providername`) per file type.
Use it only if you want to add custom providers without changing the default ones.
These have priority over the ones listed in `g:gxext#providers` and don't override the default ones.

```vim
let g:gxext#custom_providers = {}
```

### g:gxext#providers

Dictionary of active providers (`language#providername`) per file type.
The order is respected when executing these providers.

```vim
let g:gxext#providers = {
      \ 'global': ['global#urls', 'global#gx'],
      \ 'gitcommit': ['gitcommit#github'],
      \ 'markdown': ['markdown#link'],
      \ 'vim': ['vim#plugin'],
      \}
```

## Writing your own provider

_If you think this provider is something more people will use, feel free to open a PR!_
_If you have a plugin that integrates with gx-extended, open a PR adding it to the list!_

List your provider in your `init.vim`/`.vimrc`:

```vim
let g:gxext_custom = {'language': 'language#myprovider'}
```

Create a file in your Vim runtime path `autoload/gxext/language/myprovider.vim` with a function called `open`:

```vim
" Returns 1 if it was able to parse/open the thing under the cursor
function! gxext#language#myprovider#open(line, mode)
  return 0
endfunction
```

The argumente passed to the function are:

- line: `extend('<cfile>')` if mode is `normal` or the selection from the first line if mode is `visual`
- mode: `normal` or `visual`

Note: these argumente can be useful, but aren't required to be used.
You can get the information from the current line or buffer using any of the Vim builtin functions.

Note: If you want your function to be called over all file types, use `global` as language.

See [autoload/gxext/](autoload/gxext/) for examples.

## Do I need this plugin?

If you press `gx` when the cursor is under an URL,
the URL will open in a new tab in your browser or in your file explorer.
This functionality is provided by default by `Netrw`
(the default file explorer included in Vim).
_You can extend_ `Netrw`, see `:h netrw_filehandler`,
but it has its limitations:

- You can only extend it to support new suffixes (.doc, .csv, etc).
- If you override the `gx` mapping, you'll loose the default behavior of `gx`.

If you don't care about any of those things,
then you are probably fine without this plugin.
