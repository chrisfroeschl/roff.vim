" File: autocmd.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Sat 27 Feb 2021 07:19:37 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Roff autocmds.

" Troff autocmds. {{{

augroup TROFF_AUTOCOMPILE
    autocmd BufWritePost <buffer> :silent make! | :silent redraw!
augroup END

" }}}
