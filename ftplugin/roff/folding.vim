" File: folding.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Sat 27 Feb 2021 03:52:44 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Roff folding settings.

" Folding settings {{{

if has('folding')
    setlocal foldmethod=syntax
    setlocal foldlevelstart=0
endif

" }}}
