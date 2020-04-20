" "   /\      /\                         _     _
" "  /  |___ |  \                       | |   / /
" " :   _      _ :                      | |  / / _  _   _  ____   ____
" " |  __     __ |                      | | / / |_|| \_/ ||    | |  __|
" " |       .    |                    _ | |/ /  | ||  _  || |\ \ | |__
" "        ^    _) Marusa's ordinary |_||___/   |_||_| |_||_| \_||____|

inoremap <S-CR> <Esc>
set nocompatible
syntax on
let mapleader =" "
set splitbelow splitright

"Plugin Shiet
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
		Plugin 'VundleVim/Vundle.vim'
		Plugin 'tpope/vim-Fugitive'
		Plugin 'itchyny/lightline.vim'
		Plugin 'junegunn/goyo.vim'
		Plugin 'https://github.com/chrisbra/Colorizer'
		Plugin 'dracula/vim', { 'name': 'dracula' }
	call vundle#end()
filetype plugin indent on

"Airline buffer tabs
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_powerline_fonts = 1
	let g:airline#extensions#coc#enabled = 1

"Goyo visualization mode
	map <leader>f :Goyo \| set linebreak<CR>

"Theme
if has("gui_running")
"	set background=dark
"	colorscheme solarized8
	colorscheme dracula
"Airline theme
	"let g:airline_theme='solarized'
else
	set t_Co=16
"Airline theme
	let g:airline_theme='deus'
endif
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"GVIM stuff
	"GVIM remove menubar, toolbar and scrollbars
		set go=
	"Menubar shortcut
		map mm :if &go=='m'\|set go=\|else\|set go=m\|endif\|echo 'Menubar toggled'<CR>
	"GVIM font
		set guifont=MonteCarlo\ Fixed\ 12\ Regular\ 12

		set mouse=a

"Lines Number
	set number relativenumber
	set nu rnu

	set nowrap
"Reload configs
	autocmd BufWritePost ~/.Xresources !{xrdb %}
	autocmd BufWritePost ~/.config/compton.conf !{pgrep compton && pkill -USR1 compton;pgrep picom && pkill -USR1 picom}
	autocmd BufWritePost ~/.config/i3/config !{i3-msg reload}
	"autocmd BufWritePost ~/Documents/suckless/dwm/config.h !{make && sudo make install && pkill dwm}
	"autocmd BufWritePost ~/dwm/config.h !{make && sudo make install && pkill dwm}

" Go to tab by number
	noremap <leader>1 1gt \| :echo ""<cr>
	noremap <leader>2 2gt \| :echo ""<cr>
	noremap <leader>3 3gt \| :echo ""<cr>
	noremap <leader>4 4gt \| :echo ""<cr>
	noremap <leader>5 5gt \| :echo ""<cr>
	noremap <leader>6 6gt \| :echo ""<cr>
	noremap <leader>7 7gt \| :echo ""<cr>
	noremap <leader>8 8gt \| :echo ""<cr>
	noremap <leader>9 9gt \| :echo ""<cr>
	noremap <leader>0 :tablast \| echo ""<cr>
	noremap <leader><tab> :tabnext \| echo ""<cr>

" Split navigation shortcut
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l
	map <C-K> <C-w>>
	map <C-J> <C-w><

" Love2d plugin setting
	let g:lovedocs_colors = 'guifg=#ff60e2 ctermfg=206'
	map <leader>r :!{love .}<CR>
	map <leader>d :!{./build.sh}<CR>

"size of tabs
	set tabstop=4
	set shiftwidth=0
