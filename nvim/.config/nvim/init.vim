syntax on
set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4 
set expandtab
set smartindent
set nohlsearch
set hidden
set noerrorbells
set nu
set relativenumber
set nowrap
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors 
set scrolloff=8
set signcolumn=yes 
set guicursor=
set colorcolumn=80
set backspace=indent,eol,start
set lazyredraw           
set ignorecase smartcase
set regexpengine=0
set diffopt+=vertical
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set splitbelow

filetype plugin indent on

call plug#begin('~/.config/nvim/plugins')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe' 
Plug 'onsails/lspkind-nvim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim'
Plug 'craigemery/vim-autotag'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-bundler'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'szw/vim-maximizer'
Plug 'tpope/vim-surround'
Plug 'puremourning/vimspector'
Plug 'ryanoasis/vim-devicons'
Plug 'andweeb/presence.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } 
Plug 'rafi/awesome-vim-colorschemes'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'hoob3rt/lualine.nvim'
Plug 'akinsho/nvim-bufferline.lua'
call plug#end()

colorscheme nord

let g:user_emmet_mode='a'
let g:far#enable_undo=1
let g:user_emmet_leader_key=','
let g:VM_show_warnings = 0
let mapleader=' ' 
let g:vimspector_enable_mappings = 'HUMAN'
let g:UltiSnipsExpandTrigger="<c-s>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"


" Vim Fugitive setup
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gc :GCheckout<CR>
nnoremap <leader>gs :G<CR>
nnoremap <leader>ds :Gdiffsplit<CR>
nnoremap <leader>gj :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gl :Git log<CR>

" Miscellaneous remaps
nnoremap <leader>s :w<CR>
nnoremap <leader>ss :w <bar> :bd<CR>
nnoremap <leader>S :w<CR>
nnoremap <leader>SS :w <bar> :bd<CR>
nnoremap <leader>e :Explore<CR>
nnoremap <leader>sa gg <bar> V <bar> G<CR>

"quickfix list remaps
nnoremap <C-q> :call ToggleList("Quickfix List", 'c')<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

"location list remaps
nnoremap <leader>q :call ToggleList("Location List", 'l')<CR>
" second remap for closing location list in case of impatience (both should work)
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprev<CR>

"Vim maximizer remap
nnoremap <leader>m :MaximizerToggle!<CR>

" semicolon remaps
nnoremap ; :
nnoremap : ;
vnoremap ; : 
vnoremap : ;

" exit insert mode remaps
inoremap kj <Esc>
inoremap KJ <Esc>
inoremap jk <Esc>
inoremap JK <Esc>

"rails remaps
nnoremap <leader>rc :Econtroller<CR>
nnoremap <leader>rv :Eview<CR>
nnoremap <leader>rm :Emodel<CR>

"Vimspector remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

"Greatest remap ever
vnoremap <leader>p "_dP

" treesitter activation
lua <<EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
    highlight = {
        enable = true,              -- false will disable the whole extension
    },
}
EOF

hi Normal guibg=NONE ctermbg=NONE

" remaps to make tab for autocomplete work
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

"set completeopt=menuone,noselect

" easier search shortcut
nnoremap <leader>f /\<\><left><left>
nnoremap <leader>ff /\<<C-r><C-w>\>/g<CR>
nnoremap <leader>fr :%s/\<\>//g<left><left><left><left><left>
nnoremap <leader>frr :%s/\<<C-r><C-w>\>//g<left><left>

" telescope remaps
nnoremap <C-p> <cmd>Telescope git_files<cr>
nnoremap <leader>gc <cmd>Telescope git_branches<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>gg <cmd>Telescope grep_string<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>

" lua for telescope initialization
lua <<EOF
require('telescope').setup {
    defaults = {
        file_sorter =  require'telescope.sorters'.get_fzy_sorter,
        vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            },
        mappings = {
            i = {
                ["<C-q>"] = require("telescope.actions").send_to_qflist,
                },
            },
        only_sort_text = true,
        color_devicons= true,
        layout_config = {
            height = 0.7
            }
        },

    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
            }
        }
    }

require('telescope').load_extension('fzy_native')

local M = {}

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.git_delete_branch)
            map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

return M
EOF

lua << EOF
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>gy', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rf', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>ld', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', "<leader>fm", '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "tsserver", "clangd", "pyright", "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
EOF


" functions to enable toggling of quickfix and location lists

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

lua << EOF
require('lspkind').init({
    -- enables text annotations
    --
    -- default: true
    with_text = true,
})

EOF

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true; debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = {
    border = { '', '' ,'', ' ', '', '', '', ' ' }, -- the border option is the same as `|help nvim_open_win|`
    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
    max_width = 120,
    min_width = 60,
    max_height = math.floor(vim.o.lines * 0.3),
    min_height = 1,
  };

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF

lua << EOF
require('lualine').setup({
    options = {
        theme = 'nord'
    }
})
EOF

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

lua << EOF
require("bufferline").setup{
    options = {
        diagnostics = "nvim_lsp"
        }
}
EOF

nnoremap <leader>t :new +resize20 term://zsh<CR>
