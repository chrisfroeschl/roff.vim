" File: roff.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Thu 18 Feb 2021 08:03:02 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Roff file specific functionality.

" Plugin pre check. {{{

" Only do this when not done yet for this buffer.
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" }}}

" Troff settings. {{{

setlocal nosmartindent
setlocal foldmethod=marker
setlocal foldlevelstart=0

if !exists('g:troff_text_obj_enabled')
	let g:troff_text_obj_enabled = 1
endif

if !exists('g:groff_install_prefix')
    let g:groff_install_prefix='/usr/share'
endif

" User specified macro directory.
if !exists('g:troff_macro_dir')
	let g:troff_macro_dir='/usr/share/groff/1.19.2/tmac'
endif

" Allow for sourcing local macro packages.
setlocal include=^\\.m\\?so

" }}}

" Troff autocmds. {{{

augroup TROFF_AUTOCOMPILE
    try
	autocmd BufWritePost <buffer> :silent make! | :silent redraw!
    catch /.*/
	echo 'busy'
    endtry
augroup END

" }}}
