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

See [`:h gx-extended`](doc/gx-extended.txt)
for more information about settings and how to write your own provider.

## Providers

Providers with the `global` file type work across all file types.

### global#urls

Opens links with/without an explicit protocol. Examples:

- A cursor under `google.com` will open `https://google.com`

### global#gx

Mimics the original `gx` command.

### gitcommit#github

Opens an issue/PR from a git commit message. Examples:

- A cursor under `Fixes #23` will open `https://github.com/user/repo/issues/23`

Note:

  You need to have installed [`hub`](https://github.com/github/hub) (recommended),
  or [`tpope/vim-fugitive`](https://github.com/tpope/vim-fugitive).

### markdown#link

Opens Markdown links. Examples:

- A cursor under `[link](https://google.com)` will open `https://google.com`

Note:

  If you have [`plasticboy/vim-markdown`](https://github.com/plasticboy/vim-markdown) installed
  (it's included in [`sheerun/vim-polyglot`](https://github.com/sheerun/vim-polyglot))
  you'll need to disable the default key mappings,
  since that plugin remaps `gx` by default.

### vim#plugin

Opens the GitHub page of the plugin under the cursor. Examples:

- A cursor under `Plug stsewd/fzf-checkout.vim`
  will open `https://github.com/stsewd/fzf-checkout.vim`

## TODO

- ReStructuredText?
- requirements.txt?
- Allow plugins to register their own providers?
- Write tests
