set ignorecase
set smartcase
set clipboard+=unnamedplus
set scrolloff=8
set nohlsearch
set incsearch
set startofline
set modifiable " https://stackoverflow.com/questions/5745506/vim-modifiable-is-off
set number relativenumber

imap <C-c> <Nop>

command Reload source $MYVIMRC

" https://www.reddit.com/r/neovim/comments/rfrgq5/is_it_possible_to_do_something_like_his_on/hoidy8j/?context=3
" google lunarvim https://www.reddit.com/r/neovim/comments/rgi9m0/opinions_on_lunarvim_i_want_to_like_it_but_shit/
" :set cursorline! will toggle between its two settings https://stackoverflow.com/a/3097964
