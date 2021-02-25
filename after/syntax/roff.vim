" File: roff.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Sun 21 Feb 2021 12:50:18 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Roff syntax to load after inital setup.

syntax match roffComment "\v\.\\\".*$"
highlight link roffComment Comment
