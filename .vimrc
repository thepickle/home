se rtp=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
se vi+=n~/.viminfo

runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on
syntax on

let hhcs_both_all_linenr='normal'
let hhcs_both_all_nontext='normal'
colo hhdgray

let VCSCommandEnableBufferSetup=1
let VCSCommandCVSAnnotateParent=1
let VCSCommandSplit='vertical'

let tlist_sql_settings='sql;p:procedure'
let Tlist_Process_File_Always=1

se bs=indent,eol,start
se ww+=<,>,[,]
se ve=block
se fdm=indent
se dip+=vertical
se gp=internal
se stl=[%n]%<%-35(%f%h%m%r%)%{fugitive#statusline()}%{VCSCommandGetStatusLine()}%([%{Tlist_Get_Tagname_By_Line()}]%)%=%(%l/%L(%P),%c%V%)
se ruf=%(%l/%L(%P),%c%V%)
se csqf=s-,g-,d-,c-,t-,e-,f0,i-
se wak=no
se wim=longest,list
se ts=8 sts=3 sw=3 ls=2 hi=10000

se nu ru spr noea ic scs is hls ssl ai si sta ar nowrap hid noswf

aug VCSCommand
  au User VCSBufferCreated sil! nmap <unique> <buffer> q :bw<cr>
aug END

com! -nargs=? -complete=customlist,CmdACom A call CmdA(<f-args>)

fu! CmdACom(a,c,p)
   let l:l=[]
   for l:a in sort(argv())
      if l:a=~a:a
	 call add(l:l,l:a)
      en
   endfo
   return l:l
endf

fu! CmdA(...)
   if a:0
      let l:a=1+match(argv(),a:1)
      exe l:a 'argu'
   el
      let l:n=len(string(len(argv())))
      for l:i in range(len(argv()))
	 ech printf('%'.l:n.'d %s',1+l:i,get(argv(),l:i))
      endfo
   en
endf

" general
nnoremap <unique> Y y$

nnoremap <unique>   g
nnoremap <unique> g  

nmap <unique> <m-d> :pw<cr>
nmap <unique> <m-space> :simalt ~<cr>
nmap <unique> <m-v> :lc ~/builds/

nmap <unique> <m-/> :let @+=substitute(@+,'\/','\\','ge')<cr>
nmap <unique> <m-\> :let @+=substitute(@+,'\\','\/','ge')<cr>
nmap <unique> <m-f> <m-5><m-p><m-/>

nmap <unique> <kDivide>   g-
nmap <unique> <kMultiply> g+
nmap <unique> du :diffu<cr>

" F-Keys
nmap <unique> <F3>   :lnext<cr>
nmap <unique> <s-F3> :lNext<cr>
nmap <unique> <F4>   :cnext<cr>
nmap <unique> <s-F4> :cNext<cr>

" scratch
nmap <unique> <m-1> :new<bar>se bt=nofile<cr>
nmap <unique> <m-2> :vne<bar>se bt=nofile<cr>

" preview window
nmap <unique> <m-P> <c-w>P
nmap <unique> <m-z> <c-w>z

" to new tab page
nmap <unique> <m-T> <c-w>T

" window size
nmap <unique> <m-+> <c-w>+
nmap <unique> <m--> <c-w>-
nmap <unique> <m-<> <c-w><
nmap <unique> <m->> <c-w>>
nmap <unique> <m-=> <c-w>=
nmap <unique> <m-_> <c-w>_
nmap <unique> <m-bar> <c-w><bar>

" window split
nmap <unique> <m-n> :new<cr>
nmap <unique> <m-N> :vne<cr>
nmap <unique> <m-s> <c-w>s
nmap <unique> <m-S> <c-w>v
nmap <unique> <m-F> <c-w>F
nmap <unique> <m-^> <c-w>^
nmap <unique> <m-]> <c-w>]
nmap <unique> <m-}> <c-w>}

" window close
nmap <unique> <m-c> <c-w>c
nmap <unique> <m-o> <c-w>o

" window navigation
nmap <unique> <m-h> <c-w>h
nmap <unique> <m-j> <c-w>j
nmap <unique> <m-k> <c-w>k
nmap <unique> <m-l> <c-w>l
nmap <unique> <m-H> <c-w>H
nmap <unique> <m-J> <c-w>J
nmap <unique> <m-K> <c-w>K
nmap <unique> <m-L> <c-w>L
nmap <unique> <m-w> <c-w>w
nmap <unique> <m-W> <c-w>W
nmap <unique> <m-b> <c-w>b
nmap <unique> <m-t> <c-w>t
nmap <unique> <m-p> <c-w>p
nmap <unique> <m-Left>  gT
nmap <unique> <m-Right> gt

" fname modification
nmap <unique> <m-#> :let @+=@#<cr>
nmap <unique> <m-%> :let @+=@%<cr>

nmap <unique> <m-3><m-e> :let @+=expand('#:e')<cr>
nmap <unique> <m-3><m-h> :let @+=expand('#:h')<cr>
nmap <unique> <m-3><m-p> :let @+=expand('#:p')<cr>
nmap <unique> <m-3><m-r> :let @+=expand('#:r')<cr>
nmap <unique> <m-3><m-t> :let @+=expand('#:t')<cr>

nmap <unique> <m-5><m-e> :let @+=expand('%:e')<cr>
nmap <unique> <m-5><m-h> :let @+=expand('%:h')<cr>
nmap <unique> <m-5><m-p> :let @+=expand('%:p')<cr>
nmap <unique> <m-5><m-r> :let @+=expand('%:r')<cr>
nmap <unique> <m-5><m-t> :let @+=expand('%:t')<cr>

" mapmode-ic
map! <unique> <m-a> \a
map! <unique> <m-A> \A
map! <unique> <m-i> \i
map! <unique> <m-I> \I
map! <unique> <m-k> \k
map! <unique> <m-K> \K
map! <unique> <m-f> \f
map! <unique> <m-F> \F
map! <unique> <m-p> \p
map! <unique> <m-P> \P
map! <unique> <m-s> \s
map! <unique> <m-S> \S
map! <unique> <m-d> \d
map! <unique> <m-D> \D
map! <unique> <m-x> \x
map! <unique> <m-X> \X
map! <unique> <m-o> \o
map! <unique> <m-O> \O
map! <unique> <m-h> \h
map! <unique> <m-H> \H
map! <unique> <m-l> \l
map! <unique> <m-L> \L
map! <unique> <m-u> \u
map! <unique> <m-U> \U
map! <unique> <m-w> \w
map! <unique> <m-W> \W
map! <unique> <m-e> \e
map! <unique> <m-t> \t
map! <unique> <m-r> \r
map! <unique> <m-b> \b
map! <unique> <m-n> \n
map! <unique> <m-0> \0
map! <unique> <m-1> \1
map! <unique> <m-2> \2
map! <unique> <m-c> \c
map! <unique> <m-C> \C
map! <unique> <m-m> \m
map! <unique> <m-M> \M
map! <unique> <m-v> \v
map! <unique> <m-V> \V

map! <unique> <m-9> \(\)<Left><Left>
map! <unique> <m-(> \(
map! <unique> <m-)> \)

map! <unique> <m-,> \<\><Left><Left>
map! <unique> <m-<> \<
map! <unique> <m->> \>

map! <unique> <m-bar> \<bar>
map! <unique> <m-\> \\
map! <unique> <m-.> \.
map! <unique> <m-8> \*
map! <unique> <m-=> \+
map! <unique> <m-/> \/
map! <unique> <m-?> \?

map! <unique> <m-%> <c-r>%
map! <unique> <m-#> <c-r>#
map! <unique> <m-e><m-w> <c-r>=expand('<cword>')<cr>
map! <unique> <m-e><m-W> <c-r>=expand('<cWORD>')<cr>
map! <unique> <m-e><m-f> <c-r>=expand('<cfile>')<cr>

map! <unique> <m-3><m-e> <c-r>=expand('#:e')<cr>
map! <unique> <m-3><m-h> <c-r>=expand('#:h')<cr>
map! <unique> <m-3><m-p> <c-r>=expand('#:p')<cr>
map! <unique> <m-3><m-r> <c-r>=expand('#:r')<cr>
map! <unique> <m-3><m-t> <c-r>=expand('#:t')<cr>

map! <unique> <m-5><m-e> <c-r>=expand('%:e')<cr>
map! <unique> <m-5><m-h> <c-r>=expand('%:h')<cr>
map! <unique> <m-5><m-p> <c-r>=expand('%:p')<cr>
map! <unique> <m-5><m-r> <c-r>=expand('%:r')<cr>
map! <unique> <m-5><m-t> <c-r>=expand('%:t')<cr>

" read command
nmap <unique> <m-r> :r!
nmap <unique> <m-R> y$<m-r><c-r>"

" ctrl-keys
nmap <unique> <c-tab>   gt
nmap <unique> <c-s-tab> gT

nmap <unique> <c-s> :up<cr>
imap <unique> <c-s> <c-o><c-s>

imap <unique> <c-v> <c-\><c-o>"+gP
cmap <unique> <c-v> <c-r>+

