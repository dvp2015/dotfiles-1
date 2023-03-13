local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

-- Edit nvim configuration
map('n', '<leader>ev', ':e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })

-- Системный буфер обмена shift - Y
map('v', 'S-Y', '"+y', {})
-- Типа 'Нажимает' на ESC при быстром нажатии jk, чтобы не тянутся
map('i', 'jk', '<Esc>', {noremap = true})
-- Навигация
-- Start and end of line
map('n', 'H', '^', default_opts)
map('n', 'L', '$', default_opts)
map('v', 'L', 'g_', default_opts)

-- move vertically by visual line
map('n', 'j', 'gj', default_opts)
map('n', 'k', 'gk', default_opts)

-- Window manipulation

-- Resize window vertically
map('n', '+', '<c-w>+', default_opts)
map('n', '_', '<c-w>-', default_opts)
-- ... horizontally
map('n', '=', '<c-w>>', default_opts)
map('n', '-', '<c-w><', default_opts)

map('n', '<c-h>', '<c-w>h', default_opts)
map('n', '<c-j>', '<c-w>j', default_opts)
map('n', '<c-k>', '<c-w>k', default_opts)
map('n', '<c-l>', '<c-w>l', default_opts)

map('i', '<c-h>', '<c-o><c-w>h', default_opts)
map('i', '<c-j>', '<c-o><c-w>j', default_opts)
map('i', '<c-k>', '<c-o><c-w>k', default_opts)
map('i', '<c-l>', '<c-o><c-w>l', default_opts)

-- highlight last inserted text
map('n', '<leader>gv', '`[v`]', default_opts)

-- Remove search highlight
map('n', '<leader>/', ':nohlsearch<CR>', default_opts)

map('n', '<leader>,', ':cprevious<CR>', default_opts)
map('n', '<leader>.', ':cnext<CR>', default_opts)

-- Convert word to uppercase
map('i', '<c-u>', '<Esc>viwUea', default_opts)

-- продолжить перенос из vimrc здесь

-- Стрелочки откл. Использовать hjkl
map('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
map('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
map('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
map('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})
-- Автоформат + сохранение по CTRL-s , как в нормальном, так и в insert режиме
map('n', '<C-s>', ':Autoformat<CR>:w<CR>',  default_opts)
map('i', '<C-s>', '<esc>:Autoformat<CR>:w<CR>', default_opts)
-- Переключение вкладок с помощью TAB или shift-tab (akinsho/bufferline.nvim)
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
-- Пролистнуть на страницу вниз / вверх (как в браузерах)
-- map('n', '<Space>', '<PageDown> zz', default_opts)
-- map('n', '<C-Space>', '<PageUp> zz', default_opts)
-- " Переводчик рус -> eng
map('v', 't', '<Plug>(VTranslate)', {})
-- fzf
map('n', '<C-a>', [[ <cmd>lua require('telescope.builtin').find_files()<cr>]], default_opts)
map('n', '<C-p>', [[ <cmd>lua require('telescope.builtin').buffers()<cr>]], default_opts)

-----------------------------------------------------------
-- Фн. клавиши по F1 .. F12
-----------------------------------------------------------
-- По F1 очищаем последний поиск с подсветкой
--map('n', '<F1>', ':nohl<CR>', default_opts)
-- shift + F1 = удалить пустые строки
map('n', '<S-F1>', ':g/^$/d<CR>', default_opts)
-- <F2> для временной вставки из буфера, чтобы отключить авто идент
vim.o.pastetoggle='<F2>'
-- <F3> перечитать конфигурацию nvim Может не работать, если echo $TERM  xterm-256color
-- map('n', '<F3>', ':so ~/.config/nvim/init.lua<CR>:so ~/.config/nvim/lua/plugins.lua<CR>:so ~/.config/nvim/lua/settings.lua<CR>:so ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <S-F3> Открыть всю nvim конфигурацию для редактирования
-- map('n', '<S-F3>', ':e ~/.config/nvim/init.lua<CR>:e ~/.config/nvim/lua/plugins.lua<CR>:e ~/.config/nvim/lua/settings.lua<CR>:e ~/.config/nvim/lua/keymaps.lua<CR>', { noremap = true })
-- <F4> Поиск слова под курсором
map('n', '<F4>', [[<cmd>lua require('telescope.builtin').grep_string()<cr>]], default_opts)
-- <S-F4> Поиск слова в модальном окошке
map('n', '<S-F4>', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]], default_opts)
-- <F5> разные вариации нумераций строк, можно переключаться
map('n', '<F5>', ':exec &nu==&rnu? "se nu!" : "se rnu!"<CR>', default_opts)
-- <F6> дерево файлов.
map('n', '<F6>', ':NvimTreeRefresh<CR>:NvimTreeToggle<CR>', default_opts)
-- <F8>  Показ дерева классов и функций, плагин majutsushi/tagbar
map('n', '<F8>', ':TagbarToggle<CR>', default_opts)
-- <F11> Проверка орфографии  для русского и английского языка
map('n', '<F11>', ':set spell!<CR>', default_opts)
map('i', '<F11>', '<C-O>:set spell!<CR>', default_opts)
