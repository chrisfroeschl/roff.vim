" File: roff.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Thu 18 Feb 2021 08:06:41 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Filetype detection for roff.

autocmd! BufRead,BufNewFile *.man,*.t,*.roff,*.ms,*.mom,*.me,*.mm,*.tr,*.troff,*.tmac setfiletype roff
