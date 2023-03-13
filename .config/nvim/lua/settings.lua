local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options
-- leaders
g.mapleader = ' '
g.localleader = '\\'
-- Направление перевода с русского на английский
g.translate_source = 'ru'
g.translate_target = 'en'
-- Компактный вид у тагбара и Отк. сортировка по имени у тагбара
g.tagbar_compact = 1
g.tagbar_sort = 0

-- Конфиг ale + eslint
g.ale_fixers = { javascript= { 'eslint' } }
g.ale_sign_error = '❌'
g.ale_sign_warning = '⚠️'
g.ale_fix_on_save = 1
-- Запуск линтера, только при сохранении
g.ale_lint_on_text_changed = 'never'
g.ale_lint_on_insert_leave = 0

-----------------------------------------------------------
-- Главные
-----------------------------------------------------------
opt.backup = false                  -- Don't create backup files, use git
opt.writebackup = false             -- ...
opt.colorcolumn = '100'             -- Разделитель на 100 символов
opt.cursorline = true               -- Подсветка строки с курсором
opt.encoding = 'utf-8'              -- Кодировка
opt.foldcolumn = '2'                -- Ширина колонки для фолдов
opt.hidden = true                   -- Don't unload abandoned buffers
opt.mouse = 'a'                     -- Включить мышь
opt.number = true                   -- Включаем нумерацию строк
opt.relativenumber = true           -- Вкл. относительную нумерацию строк
-- opt.sessionoptions += 'globals'       -- Save global values to session script
opt.showcmd = true                  -- Отображение команд
opt.so=999                          -- Курсор всегда в центре экрана
-- opt.so = 5                          --Отступ курсора от края экрана
opt.spelllang= { 'en_us', 'ru' }    -- Словари рус eng
opt.splitbelow = true               -- horizontal split вниз
opt.splitright = true               -- vertical split вправо
opt.swapfile = false                -- не создаем swap file
opt.undofile = true                 -- Возможность отката назад
opt.wrap = false
-----------------------------------------------------------
-- Цветовая схема
-----------------------------------------------------------
opt.termguicolors = true      --  24-bit RGB colors
cmd'colorscheme onedark'
------------------------------------------------------------------
-- automatically run :PackerCompile whenever plugins.lua is updated
-------------------------------------------------------------------
cmd([[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])
-----------------------------------------------------------
-- Табы и отступы
-----------------------------------------------------------
cmd([[
    filetype indent plugin on
    syntax enable
]])
opt.expandtab = true      -- use spaces instead of tabs
opt.shiftwidth = 4        -- shift 4 spaces when tab
opt.tabstop = 4           -- 1 tab == 4 spaces
opt.smartindent = true    -- autoindent new lines
opt.shiftround = true     -- indent to multiple of 'shiftwidth'
opt.autoindent = true     -- align the new line indent with the previous line
-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]
-- remove line lenght marker for selected filetypes
cmd [[autocmd FileType text,markdown,html,xhtml,javascript setlocal cc=0]]
-- 2 spaces for selected filetypes
cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,lua,yaml,htmljinja setlocal shiftwidth=2 tabstop=2
]]
-- С этой строкой отлично форматирует html файл, который содержит jinja2
cmd[[ autocmd BufNewFile,BufRead *.html set filetype=htmldjango ]]
-----------------------------------------------------------
-- Полезные фишки
-----------------------------------------------------------
-- Запоминает где nvim последний раз редактировал файл
cmd [[
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
]]
-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
augroup end
]], false)

-----------------------------------------------------------
-- Установки для плагинов
-----------------------------------------------------------
-- LSP settings
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
    if server.name == "sumneko_lua" then
        -- only apply these settings for the "sumneko_lua" server
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the 'vim', 'use' global
                    globals = {'vim', 'use'},
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    end
    server:setup(opts)
end)


-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
vim.o.completeopt = 'menuone,noselect'
-- luasnip setup
local luasnip = require 'luasnip'
-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer', option = {
            get_bufnrs = function()
                return vim.api.nvim_list_bufs()
            end
        },
    },
},
}
