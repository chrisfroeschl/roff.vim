" File: roff.vim
" Maintainer: Chris Fröschl <cfroeschl@protonmail.com>
" Last Modified: Sat 27 Feb 2021 03:51:58 PM CET
" License:
" Copyright (c) Chris Fröschl. Distributed under the same terms as Vim itself.
" See :help license
"
" Description:
" Extended syntax support for roff. 

" Starter {{{

" Since we only append syntax to groff, we don't have to do the traditional current_syntax
" check afterwards.
runtime! syntax/groff.vim

if !exists('g:roff_greek')
	let g:roff_greek =1
endif
if !exists('g:roff_math')
	let g:roff_math =1
endif
if !exists('g:roff_supsub')
	let g:roff_supsub =1
endif

" }}}

" RoffConceal {{{

" RoffConceal: Helper function {{{

" TODO Probably have to set conceallevel in plugin locally.
if has("conceal")
    function! s:RoffConceal(group, pat, cchar)
        exe 'syntax match ' . a:group . " '" . a:pat . "' contained conceal cchar=" . a:cchar
    endfun

" }}}

" RoffConceal: Greek {{{

    if exists('g:roff_greek')
            call s:RoffConceal('roffGreek', '\<alpha\>', 'α')
            call s:RoffConceal('roffGreek', '\<beta\>','β')
            call s:RoffConceal('roffGreek', '\<gamma\>', 'γ')
            call s:RoffConceal('roffGreek', '\<delta\>', 'δ')
            call s:RoffConceal('roffGreek', '\<epsilon\>', 'ϵ')
            call s:RoffConceal('roffGreek', '\<varepsilon\>', 'ε')
            call s:RoffConceal('roffGreek', '\<zeta\>', 'ζ')
            call s:RoffConceal('roffGreek', '\<eta\>', 'η')
            call s:RoffConceal('roffGreek', '\<theta\>', 'θ')
            call s:RoffConceal('roffGreek', '\<vartheta\>', 'ϑ')
            call s:RoffConceal('roffGreek', '\<iota\>', 'ι')
            call s:RoffConceal('roffGreek', '\<kappa\>', 'κ')
            call s:RoffConceal('roffGreek', '\<lambda\>', 'λ')
            call s:RoffConceal('roffGreek', '\<mu\>', 'μ')
            call s:RoffConceal('roffGreek', '\<nu\>', 'ν')
            call s:RoffConceal('roffGreek', '\<xi\>', 'ξ')
            call s:RoffConceal('roffGreek', '\<pi\>', 'π')
            call s:RoffConceal('roffGreek', '\<varpi\>', 'ϖ')
            call s:RoffConceal('roffGreek', '\<rho\>', 'ρ')
            call s:RoffConceal('roffGreek', '\<varrho\>', 'ϱ')
            call s:RoffConceal('roffGreek', '\<sigma\>', 'σ')
            call s:RoffConceal('roffGreek', '\<varsigma\>', 'ς')
            call s:RoffConceal('roffGreek', '\<tau\>', 'τ')
            call s:RoffConceal('roffGreek', '\<upsilon\>', 'υ')
            call s:RoffConceal('roffGreek', '\<phi\>', 'ϕ')
            call s:RoffConceal('roffGreek', '\<varphi\>', 'φ')
            call s:RoffConceal('roffGreek', '\<chi\>', 'χ')
            call s:RoffConceal('roffGreek', '\<psi\>', 'ψ')
            call s:RoffConceal('roffGreek', '\<omega\>', 'ω')
            call s:RoffConceal('roffGreek', '\<GAMMA\>', 'Γ')
            call s:RoffConceal('roffGreek', '\<DELTA\>', 'Δ')
            call s:RoffConceal('roffGreek', '\<THETA\>', 'Θ')
            call s:RoffConceal('roffGreek', '\<LAMBDA\>', 'Λ')
            call s:RoffConceal('roffGreek', '\<XI\>', 'Ξ')
            call s:RoffConceal('roffGreek', '\<PI\>', 'Π')
            call s:RoffConceal('roffGreek', '\<SIGMA\>', 'Σ')
            call s:RoffConceal('roffGreek', '\<UPSILON\>', 'Υ')
            call s:RoffConceal('roffGreek', '\<PHI\>', 'Φ')
            call s:RoffConceal('roffGreek', '\<CHI\>', 'Χ')
            call s:RoffConceal('roffGreek', '\<PSI\>', 'Ψ')
            call s:RoffConceal('roffGreek', '\<OMEGA\>', 'Ω')
    endif 

" }}}

" RoffConceal: Math {{{

    if exists('g:roff_math')
            call s:RoffConceal('roffMath', '>= ', '≥ ')
            call s:RoffConceal('roffMath', '<= ', '≤ ')
            call s:RoffConceal('roffMath', '== ', '≡ ')
            call s:RoffConceal('roffMath', '!= ', '≠ ')
            call s:RoffConceal('roffMath', '\<int\>', '∫')
            call s:RoffConceal('roffMath', '\<inf\>', '∞')
            call s:RoffConceal('roffMath', '<-', '←')
            call s:RoffConceal('roffMath', '->', '→')
            call s:RoffConceal('roffMath', '\<partial\>', '∂')
            call s:RoffConceal('roffMath', '\<prime \>', '′')
            call s:RoffConceal('roffMath', '\<times\>', '×')
            call s:RoffConceal('roffMath', '\<prod\>', '∏')
            call s:RoffConceal('roffMath', '\<del\>', '∇')
            call s:RoffConceal('roffMath', '\<grad\>', '∇')
            call s:RoffConceal('roffMath', '\<inter\>', '∩')
            call s:RoffConceal('roffMath', '\<union\>', '∪')
            call s:RoffConceal('roffMath', '\<sum\>', '∑')
            call s:RoffConceal('roffMath', '\<sqrt\>', '√')
            call s:RoffConceal('roffMath', '\<over\>', '/')
    endif
" }}}

endif

" }}}

" SuperSub {{{

" SuperSub: Helper function {{{

if exists('g:roff_supsub')
	function! s:SuperSub(group,leader,pat,cchar)
		exe 'syntax match '.a:group." '".a:leader.a:pat."' contained conceal cchar=".a:cchar
		exe 'syntax match '.a:group."s '".a:pat        ."' contained conceal cchar=".a:cchar.' nextgroup='.a:group.'s'
	endfunction

" }}}

" SuperSub: Calls {{{

	call s:SuperSub('roffSuperscript',' sup ','\<0\>','⁰')
	call s:SuperSub('roffSuperscript',' sup ','\<1\>','¹')
	call s:SuperSub('roffSuperscript',' sup ','\<2\>','²')
	call s:SuperSub('roffSuperscript',' sup ','\<3\>','³')
	call s:SuperSub('roffSuperscript',' sup ','\<4\>','⁴')
	call s:SuperSub('roffSuperscript',' sup ','\<5\>','⁵')
	call s:SuperSub('roffSuperscript',' sup ','\<6\>','⁶')
	call s:SuperSub('roffSuperscript',' sup ','\<7\>','⁷')
	call s:SuperSub('roffSuperscript',' sup ','\<8\>','⁸')
	call s:SuperSub('roffSuperscript',' sup ','\<9\>','⁹')
	call s:SuperSub('roffSuperscript',' sup ','\<a\>','ᵃ')
	call s:SuperSub('roffSuperscript',' sup ','\<b\>','ᵇ')
	call s:SuperSub('roffSuperscript',' sup ','\<c\>','ᶜ')
	call s:SuperSub('roffSuperscript',' sup ','\<d\>','ᵈ')
	call s:SuperSub('roffSuperscript',' sup ','\<e\>','ᵉ')
	call s:SuperSub('roffSuperscript',' sup ','\<f\>','ᶠ')
	call s:SuperSub('roffSuperscript',' sup ','\<g\>','ᵍ')
	call s:SuperSub('roffSuperscript',' sup ','\<h\>','ʰ')
	call s:SuperSub('roffSuperscript',' sup ','\<i\>','ⁱ')
	call s:SuperSub('roffSuperscript',' sup ','\<j\>','ʲ')
	call s:SuperSub('roffSuperscript',' sup ','\<k\>','ᵏ')
	call s:SuperSub('roffSuperscript',' sup ','\<l\>','ˡ')
	call s:SuperSub('roffSuperscript',' sup ','\<m\>','ᵐ')
	call s:SuperSub('roffSuperscript',' sup ','\<n\>','ⁿ')
	call s:SuperSub('roffSuperscript',' sup ','\<o\>','ᵒ')
	call s:SuperSub('roffSuperscript',' sup ','\<p\>','ᵖ')
	call s:SuperSub('roffSuperscript',' sup ','\<r\>','ʳ')
	call s:SuperSub('roffSuperscript',' sup ','\<s\>','ˢ')
	call s:SuperSub('roffSuperscript',' sup ','\<t\>','ᵗ')
	call s:SuperSub('roffSuperscript',' sup ','\<u\>','ᵘ')
	call s:SuperSub('roffSuperscript',' sup ','\<v\>','ᵛ')
	call s:SuperSub('roffSuperscript',' sup ','\<w\>','ʷ')
	call s:SuperSub('roffSuperscript',' sup ','\<x\>','ˣ')
	call s:SuperSub('roffSuperscript',' sup ','\<y\>','ʸ')
	call s:SuperSub('roffSuperscript',' sup ','\<z\>','ᶻ')
	call s:SuperSub('roffSuperscript',' sup ','\<A\>','ᴬ')
	call s:SuperSub('roffSuperscript',' sup ','\<B\>','ᴮ')
	call s:SuperSub('roffSuperscript',' sup ','\<D\>','ᴰ')
	call s:SuperSub('roffSuperscript',' sup ','\<E\>','ᴱ')
	call s:SuperSub('roffSuperscript',' sup ','\<G\>','ᴳ')
	call s:SuperSub('roffSuperscript',' sup ','\<H\>','ᴴ')
	call s:SuperSub('roffSuperscript',' sup ','\<I\>','ᴵ')
	call s:SuperSub('roffSuperscript',' sup ','\<J\>','ᴶ')
	call s:SuperSub('roffSuperscript',' sup ','\<K\>','ᴷ')
	call s:SuperSub('roffSuperscript',' sup ','\<L\>','ᴸ')
	call s:SuperSub('roffSuperscript',' sup ','\<M\>','ᴹ')
	call s:SuperSub('roffSuperscript',' sup ','\<N\>','ᴺ')
	call s:SuperSub('roffSuperscript',' sup ','\<O\>','ᴼ')
	call s:SuperSub('roffSuperscript',' sup ','\<P\>','ᴾ')
	call s:SuperSub('roffSuperscript',' sup ','\<R\>','ᴿ')
	call s:SuperSub('roffSuperscript',' sup ','\<T\>','ᵀ')
	call s:SuperSub('roffSuperscript',' sup ','\<U\>','ᵁ')
	call s:SuperSub('roffSuperscript',' sup ','\<W\>','ᵂ')
	call s:SuperSub('roffSuperscript',' sup ','\<,\>','︐')
	call s:SuperSub('roffSuperscript',' sup ','\<:\>','︓')
	call s:SuperSub('roffSuperscript',' sup ','\<;\>','︔')
	call s:SuperSub('roffSuperscript',' sup ','\<+\>','⁺')
	call s:SuperSub('roffSuperscript',' sup ','\<-\>','⁻')
	call s:SuperSub('roffSuperscript',' sup ','\<<\>','˂')
	call s:SuperSub('roffSuperscript',' sup ','\<>\>','˃')
	call s:SuperSub('roffSuperscript',' sup ','\</\>','ˊ')
	call s:SuperSub('roffSuperscript',' sup ','\<(\>','⁽')
	call s:SuperSub('roffSuperscript',' sup ','\<)\>','⁾')
	call s:SuperSub('roffSuperscript',' sup ','\<\\>.','˙')
	call s:SuperSub('roffSuperscript',' sup ','\<=\>','˭')
	call s:SuperSub('roffSuperscript',' sup ','\<4\>','⁴')
	call s:SuperSub('roffSuperscript',' sup ','\<5\>','⁵')
	call s:SuperSub('roffSuperscript',' sup ','\<6\>','⁶')
	call s:SuperSub('roffSuperscript',' sup ','\<7\>','⁷')
	call s:SuperSub('roffSuperscript',' sup ','\<8\>','⁸')
	call s:SuperSub('roffSuperscript',' sup ','\<9\>','⁹')
	call s:SuperSub('roffSuperscript',' sup ','\<a\>','ᵃ')
	call s:SuperSub('roffSuperscript',' sup ','\<b\>','ᵇ')
	call s:SuperSub('roffSuperscript',' sup ','\<c\>','ᶜ')
	call s:SuperSub('roffSuperscript',' sup ','\<d\>','ᵈ')
	call s:SuperSub('roffSuperscript',' sup ','\<e\>','ᵉ')
	call s:SuperSub('roffSuperscript',' sup ','\<f\>','ᶠ')
	call s:SuperSub('roffSuperscript',' sup ','\<g\>','ᵍ')
	call s:SuperSub('roffSuperscript',' sup ','\<h\>','ʰ')
	call s:SuperSub('roffSuperscript',' sup ','\<i\>','ⁱ')
	call s:SuperSub('roffSuperscript',' sup ','\<j\>','ʲ')
	call s:SuperSub('roffSuperscript',' sup ','\<k\>','ᵏ')
	call s:SuperSub('roffSuperscript',' sup ','\<l\>','ˡ')
	call s:SuperSub('roffSuperscript',' sup ','\<m\>','ᵐ')
	call s:SuperSub('roffSuperscript',' sup ','\<n\>','ⁿ')
	call s:SuperSub('roffSuperscript',' sup ','\<o\>','ᵒ')
	call s:SuperSub('roffSuperscript',' sup ','\<p\>','ᵖ')
	call s:SuperSub('roffSuperscript',' sup ','\<r\>','ʳ')
	call s:SuperSub('roffSuperscript',' sup ','\<s\>','ˢ')
	call s:SuperSub('roffSuperscript',' sup ','\<t\>','ᵗ')
	call s:SuperSub('roffSuperscript',' sup ','\<u\>','ᵘ')
	call s:SuperSub('roffSuperscript',' sup ','\<v\>','ᵛ')
	call s:SuperSub('roffSuperscript',' sup ','\<w\>','ʷ')
	call s:SuperSub('roffSuperscript',' sup ','\<x\>','ˣ')
	call s:SuperSub('roffSuperscript',' sup ','\<y\>','ʸ')
	call s:SuperSub('roffSuperscript',' sup ','\<z\>','ᶻ')
	call s:SuperSub('roffSuperscript',' sup ','\<A\>','ᴬ')
	call s:SuperSub('roffSuperscript',' sup ','\<B\>','ᴮ')
	call s:SuperSub('roffSuperscript',' sup ','\<D\>','ᴰ')
	call s:SuperSub('roffSuperscript',' sup ','\<E\>','ᴱ')
	call s:SuperSub('roffSuperscript',' sup ','\<G\>','ᴳ')
	call s:SuperSub('roffSuperscript',' sup ','\<H\>','ᴴ')
	call s:SuperSub('roffSuperscript',' sup ','\<I\>','ᴵ')
	call s:SuperSub('roffSuperscript',' sup ','\<J\>','ᴶ')
	call s:SuperSub('roffSuperscript',' sup ','\<K\>','ᴷ')
	call s:SuperSub('roffSuperscript',' sup ','\<L\>','ᴸ')
	call s:SuperSub('roffSuperscript',' sup ','\<M\>','ᴹ')
	call s:SuperSub('roffSuperscript',' sup ','\<N\>','ᴺ')
	call s:SuperSub('roffSuperscript',' sup ','\<O\>','ᴼ')
	call s:SuperSub('roffSuperscript',' sup ','\<P\>','ᴾ')
	call s:SuperSub('roffSuperscript',' sup ','\<R\>','ᴿ')
	call s:SuperSub('roffSuperscript',' sup ','\<T\>','ᵀ')
	call s:SuperSub('roffSuperscript',' sup ','\<U\>','ᵁ')
	call s:SuperSub('roffSuperscript',' sup ','\<W\>','ᵂ')
	call s:SuperSub('roffSuperscript',' sup ','\<+\>','⁺')
	call s:SuperSub('roffSuperscript',' sup ','\<-\>','⁻')
	call s:SuperSub('roffSubscript',' sub ','\<0\>','₀')
	call s:SuperSub('roffSubscript',' sub ','\<1\>','₁')
	call s:SuperSub('roffSubscript',' sub ','\<2\>','₂')
	call s:SuperSub('roffSubscript',' sub ','\<3\>','₃')
	call s:SuperSub('roffSubscript',' sub ','\<4\>','₄')
	call s:SuperSub('roffSubscript',' sub ','\<5\>','₅')
	call s:SuperSub('roffSubscript',' sub ','\<6\>','₆')
	call s:SuperSub('roffSubscript',' sub ','\<7\>','₇')
	call s:SuperSub('roffSubscript',' sub ','\<8\>','₈')
	call s:SuperSub('roffSubscript',' sub ','\<9\>','₉')
	call s:SuperSub('roffSubscript',' sub ','\<a\>','ₐ')
	call s:SuperSub('roffSubscript',' sub ','\<e\>','ₑ')
	call s:SuperSub('roffSubscript',' sub ','\<h\>','ₕ')
	call s:SuperSub('roffSubscript',' sub ','\<i\>','ᵢ')
	call s:SuperSub('roffSubscript',' sub ','\<j\>','ⱼ')
	call s:SuperSub('roffSubscript',' sub ','\<k\>','ₖ')
	call s:SuperSub('roffSubscript',' sub ','\<l\>','ₗ')
	call s:SuperSub('roffSubscript',' sub ','\<m\>','ₘ')
	call s:SuperSub('roffSubscript',' sub ','\<n\>','ₙ')
	call s:SuperSub('roffSubscript',' sub ','\<o\>','ₒ')
	call s:SuperSub('roffSubscript',' sub ','\<p\>','ₚ')
	call s:SuperSub('roffSubscript',' sub ','\<r\>','ᵣ')
	call s:SuperSub('roffSubscript',' sub ','\<s\>','ₛ')
	call s:SuperSub('roffSubscript',' sub ','\<t\>','ₜ')
	call s:SuperSub('roffSubscript',' sub ','\<u\>','ᵤ')
	call s:SuperSub('roffSubscript',' sub ','\<v\>','ᵥ')
	call s:SuperSub('roffSubscript',' sub ','\<x\>','ₓ')
	call s:SuperSub('roffSubscript',' sub ','\<,\>','︐')
	call s:SuperSub('roffSubscript',' sub ','\<+\>','₊')
	call s:SuperSub('roffSubscript',' sub ','\<-\>','₋')
	call s:SuperSub('roffSubscript',' sub ','\</\>','ˏ')
	call s:SuperSub('roffSubscript',' sub ','\<(\>','₍')
	call s:SuperSub('roffSubscript',' sub ','\<)\>','₎')
	call s:SuperSub('roffSubscript',' sub ','\<\\>.','‸')
	call s:SuperSub('roffSubscript',' sub ','\<r\>','ᵣ')
	call s:SuperSub('roffSubscript',' sub ','\<v\>','ᵥ')
	call s:SuperSub('roffSubscript',' sub ','\<x\>','ₓ')
	call s:SuperSub('roffSubscript',' sub ','\\beta\>' ,'ᵦ')
	call s:SuperSub('roffSubscript',' sub ','\\delta\>','ᵨ')
	call s:SuperSub('roffSubscript',' sub ','\\phi\>'  ,'ᵩ')
	call s:SuperSub('roffSubscript',' sub ','\\gamma\>','ᵧ')
	call s:SuperSub('roffSubscript',' sub ','\\chi\>'  ,'ᵪ')
	delfunction s:SuperSub
endif

" }}}

" }}}

" NoSpell {{{

" Avoids highlighting spelling in macro names
syntax spell toplevel
if !exists("g:roff_nospell_macros") || g:roff_nospell_macros
	syntax region nroffEscArg start=/'/ end=/'/ contained contains=nroffEscape,@nroffSpecial,@NoSpell
	syntax cluster nroffSpecial contains=nroffSpecialChar,nroffSpace,@NoSpell
	syntax match nroffReqLeader /^[.']/ contains=@NoSpell	nextgroup=nroffReqName skipwhite
	syntax region nroffIgnore start=/^[.']\s*ig/ end=/^['.]\s*\./
	syntax match nroffReqLeader /[.']/	contains=@NoSpell contained nextgroup=nroffReqName skipwhite
	syntax match nroffReqName /[^\t \\\[?]\+/ contains=@NoSpell contained nextgroup=nroffReqArg
	syntax region nroffReqArg start=/\S/ skip=/\\$/ end=/$/ contained contains=nroffEscape,@nroffSpecial,nroffString,nroffError,nroffSpaceError,nroffNumBlock,nroffComment,@NoSpell
	syntax match nroffReqName /\(if\|ie\)/ contains=@NoSpell contained nextgroup=nroffCond skipwhite
	syntax match nroffReqName /el/ contains=@NoSpell contained nextgroup=nroffReqLeader skipwhite
	syntax match nroffReqname /[da]s/  contains=@NoSpell contained nextgroup=nroffDefIdent skipwhite
	syntax region nroffDefinition matchgroup=nroffSpecialChar start=/"/ matchgroup=NONE end=/\\"/me=e-2 skip=/\\$/ start=/\S/ end=/$/ contained contains=nroffDefSpecial,@NoSpell
	syntax match nroffReqName /\(d[ei]\|am\)/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syntax match nroffReqName /als/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syntax match nroffReqName /[rn]r/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
	syntax match nroffReqName /\(rnn\|aln\)/ contains=@NoSpell contained nextgroup=nroffIdent skipwhite
endif

" }}}

" Preprocessor folding {{{

" Allow for folding of preprocessor sections
if exists('g:roff_eqndelim')
	exec 'syntax region nroffEquationDel matchgroup=Delimiter start="' . roff_eqndelim[0] .'"  matchgroup=Delimiter	end="' . roff_eqndelim[1] . '"  contains=roffGreek,roffMath,roffSuperscript,roffSubscript concealends '
endif
syntax region nroffEquation start=/^\.\s*EQ\>/ end=/^\.\s*EN\>/ contains=roffGreek,roffMath,roffSuperscript,roffSubscript fold
syntax region nroffTable start=/^\.\s*TS\>/ end=/^\.\s*TE\>/ fold
syntax region nroffPicture start=/^\.\s*PS\>/ end=/^\.\s*PE\>/ fold
syntax region nroffRefer start=/^\.\s*\[\>/ end=/^\.\s*\]\>/ fold
syntax region nroffGrap start=/^\.\s*G1\>/ end=/^\.\s*G2\>/ fold
syntax region nroffGremlin start=/^\.\s*GS\>/ end=/^\.\s*GE|GF\>/ fold

" }}}

" Highlighting {{{

highlight def link roffMath Special

" }}}
