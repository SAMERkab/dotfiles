
-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- [[ Setting options ]] See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:help option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

-- Print the line number in front of each line
vim.o.number = true

-- Use relative line numbers, so that it is easier to jump with j, k. This will affect the 'number'
-- option above, see `:h number_relativenumber`
vim.o.relativenumber = true

-- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
-- vim.api.nvim_create_autocmd('UIEnter', {
--   callback = function()
--     vim.o.clipboard = 'unnamedplus'
--   end,
-- })
--

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

-- Highlight the line where the cursor is on
vim.o.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
-- vim.o.scrolloff = 10

vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.tabstop = 2 -- A TAB character looks like 2 spaces
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

-- Show <tab> and trailing spaces
vim.o.list = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s) See `:help 'confirm'`
vim.o.confirm = true

-- Enable using pwsh as the default shell
vim.o.shell = 'pwsh'
vim.o.shellcmdflag = [[-NoLogo -NonInteractive -ExecutionPolicy RemoteSigned -Command $PSStyle.OutputRendering='plaintext';Remove-Alias -Force -ErrorAction SilentlyContinue tee;]]
vim.o.shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
vim.o.shellpipe  = '2>&1 | %%{ "$_" } | tee %s; exit $LastExitCode'
vim.o.shellquote = ''
vim.o.shellxquote = ''

-- [[ Set up keymaps ]] See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

vim.keymap.set('n', '<leader><CR>', '<C-]>')

vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>Y', '"+yg_', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>d', '"+d', { desc = 'Cut to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>D', '"+dg_', { desc = 'Cut to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard' })

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ 't', 'i' }, '<A-h>', '<C-\\><C-n><C-w>h')
vim.keymap.set({ 't', 'i' }, '<A-j>', '<C-\\><C-n><C-w>j')
vim.keymap.set({ 't', 'i' }, '<A-k>', '<C-\\><C-n><C-w>k')
vim.keymap.set({ 't', 'i' }, '<A-l>', '<C-\\><C-n><C-w>l')
vim.keymap.set({ 'n' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n' }, '<A-l>', '<C-w>l')


---------- mappings for natural languages ----------

vim.keymap.set("n", "<leader>ger", function()
  if vim.o.langmap == '' then
    vim.o.langmap = [[qwertzuiopü+#asdfghjklöäyxcvbnm\,.-^1234567890ß´QWERTZUIOPÜ*'ASDFGHJKLÖÄYXCVBNM\;:_°!\"§$%&/()=?`]]..
                   [[;qwertyuiop[]\\asdfghjkl\;'zxcvbnm\,./`1234567890-=QWERTYUIOP{}\|ASDFGHJKL:\"ZXCVBNM<>?~!@#$%^&*()_+]]
  else
    vim.o.langmap = ''
  end
end)

function unmap_insert()
  vim.keymap.set('i', 'q', 'q')
  vim.keymap.set('i', 'w', 'w')
  vim.keymap.set('i', 'e', 'e')
  vim.keymap.set('i', 'r', 'r')
  vim.keymap.set('i', 't', 't')
  vim.keymap.set('i', 'y', 'y')
  vim.keymap.set('i', 'u', 'u')
  vim.keymap.set('i', 'i', 'i')
  vim.keymap.set('i', 'o', 'o')
  vim.keymap.set('i', 'p', 'p')
  vim.keymap.set('i', '[', '[')
  vim.keymap.set('i', ']', ']')
  vim.keymap.set('i', '\\', '\\')
  vim.keymap.set('i', 'a', 'a')
  vim.keymap.set('i', 's', 's')
  vim.keymap.set('i', 'd', 'd')
  vim.keymap.set('i', 'f', 'f')
  vim.keymap.set('i', 'g', 'g')
  vim.keymap.set('i', 'h', 'h')
  vim.keymap.set('i', 'j', 'j')
  vim.keymap.set('i', 'k', 'k')
  vim.keymap.set('i', 'l', 'l')
  vim.keymap.set('i', ';', ';')
  vim.keymap.set('i', "'", "'")
  vim.keymap.set('i', 'z', 'z')
  vim.keymap.set('i', 'x', 'x')
  vim.keymap.set('i', 'c', 'c')
  vim.keymap.set('i', 'v', 'v')
  vim.keymap.set('i', 'b', 'b')
  vim.keymap.set('i', 'n', 'n')
  vim.keymap.set('i', 'm', 'm')
  vim.keymap.set('i', ',', ',')
  vim.keymap.set('i', '.', '.')
  vim.keymap.set('i', '/', '/')
  vim.keymap.set('i', '`', '`')
  vim.keymap.set('i', '1', '1')
  vim.keymap.set('i', '2', '2')
  vim.keymap.set('i', '3', '3')
  vim.keymap.set('i', '4', '4')
  vim.keymap.set('i', '5', '5')
  vim.keymap.set('i', '6', '6')
  vim.keymap.set('i', '7', '7')
  vim.keymap.set('i', '8', '8')
  vim.keymap.set('i', '9', '9')
  vim.keymap.set('i', '0', '0')
  vim.keymap.set('i', '-', '-')
  vim.keymap.set('i', '=', '=')
  vim.keymap.set('i', 'Q', 'Q')
  vim.keymap.set('i', 'W', 'W')
  vim.keymap.set('i', 'E', 'E')
  vim.keymap.set('i', 'R', 'R')
  vim.keymap.set('i', 'T', 'T')
  vim.keymap.set('i', 'Y', 'Y')
  vim.keymap.set('i', 'U', 'U')
  vim.keymap.set('i', 'I', 'I')
  vim.keymap.set('i', 'O', 'O')
  vim.keymap.set('i', 'P', 'P')
  vim.keymap.set('i', '{', '{')
  vim.keymap.set('i', '}', '}')
  vim.keymap.set('i', '|', "|")
  vim.keymap.set('i', 'A', 'A')
  vim.keymap.set('i', 'S', 'S')
  vim.keymap.set('i', 'D', 'D')
  vim.keymap.set('i', 'F', 'F')
  vim.keymap.set('i', 'G', 'G')
  vim.keymap.set('i', 'H', 'H')
  vim.keymap.set('i', 'J', 'J')
  vim.keymap.set('i', 'K', 'K')
  vim.keymap.set('i', 'L', 'L')
  vim.keymap.set('i', ':', ':')
  vim.keymap.set('i', '"', '"')
  vim.keymap.set('i', 'Z', 'Z')
  vim.keymap.set('i', 'X', 'X')
  vim.keymap.set('i', 'C', 'C')
  vim.keymap.set('i', 'V', 'V')
  vim.keymap.set('i', 'B', 'B')
  vim.keymap.set('i', 'N', 'N')
  vim.keymap.set('i', 'M', 'M')
  vim.keymap.set('i', '<', '<')
  vim.keymap.set('i', '>', '>')
  vim.keymap.set('i', '?', '?')
  vim.keymap.set('i', '~', '~')
  vim.keymap.set('i', '!', '!')
  vim.keymap.set('i', '@', '@')
  vim.keymap.set('i', '#', '#')
  vim.keymap.set('i', '$', '$')
  vim.keymap.set('i', '%', '%')
  vim.keymap.set('i', '^', '^')
  vim.keymap.set('i', '&', '&')
  vim.keymap.set('i', '*', '*')
  vim.keymap.set('i', '(', '(')
  vim.keymap.set('i', ')', ')')
  vim.keymap.set('i', '_', '_')
end
function map_german_insert()
  vim.keymap.set('i', 'q', 'q')
  vim.keymap.set('i', 'w', 'w')
  vim.keymap.set('i', 'e', 'e')
  vim.keymap.set('i', 'r', 'r')
  vim.keymap.set('i', 't', 't')
  vim.keymap.set('i', 'y', 'z')
  vim.keymap.set('i', 'u', 'u')
  vim.keymap.set('i', 'i', 'i')
  vim.keymap.set('i', 'o', 'o')
  vim.keymap.set('i', 'p', 'p')
  vim.keymap.set('i', '[', 'ü')
  vim.keymap.set('i', ']', '+')
  vim.keymap.set('i', '\\', '#')
  vim.keymap.set('i', 'a', 'a')
  vim.keymap.set('i', 's', 's')
  vim.keymap.set('i', 'd', 'd')
  vim.keymap.set('i', 'f', 'f')
  vim.keymap.set('i', 'g', 'g')
  vim.keymap.set('i', 'h', 'h')
  vim.keymap.set('i', 'j', 'j')
  vim.keymap.set('i', 'k', 'k')
  vim.keymap.set('i', 'l', 'l')
  vim.keymap.set('i', ';', 'ö')
  vim.keymap.set('i', "'", "ä")
  vim.keymap.set('i', 'z', 'y')
  vim.keymap.set('i', 'x', 'x')
  vim.keymap.set('i', 'c', 'c')
  vim.keymap.set('i', 'v', 'v')
  vim.keymap.set('i', 'b', 'b')
  vim.keymap.set('i', 'n', 'n')
  vim.keymap.set('i', 'm', 'm')
  vim.keymap.set('i', ',', ',')
  vim.keymap.set('i', '.', '.')
  vim.keymap.set('i', '/', '-')
  vim.keymap.set('i', '`', '^')
  vim.keymap.set('i', '1', '1')
  vim.keymap.set('i', '2', '2')
  vim.keymap.set('i', '3', '3')
  vim.keymap.set('i', '4', '4')
  vim.keymap.set('i', '5', '5')
  vim.keymap.set('i', '6', '6')
  vim.keymap.set('i', '7', '7')
  vim.keymap.set('i', '8', '8')
  vim.keymap.set('i', '9', '9')
  vim.keymap.set('i', '0', '0')
  vim.keymap.set('i', '-', 'ß')
  vim.keymap.set('i', '=', '´')
  vim.keymap.set('i', 'Q', 'Q')
  vim.keymap.set('i', 'W', 'W')
  vim.keymap.set('i', 'E', 'E')
  vim.keymap.set('i', 'R', 'R')
  vim.keymap.set('i', 'T', 'T')
  vim.keymap.set('i', 'Y', 'Z')
  vim.keymap.set('i', 'U', 'U')
  vim.keymap.set('i', 'I', 'I')
  vim.keymap.set('i', 'O', 'O')
  vim.keymap.set('i', 'P', 'P')
  vim.keymap.set('i', '{', 'Ü')
  vim.keymap.set('i', '}', '*')
  vim.keymap.set('i', '|', "'")
  vim.keymap.set('i', 'A', 'A')
  vim.keymap.set('i', 'S', 'S')
  vim.keymap.set('i', 'D', 'D')
  vim.keymap.set('i', 'F', 'F')
  vim.keymap.set('i', 'G', 'G')
  vim.keymap.set('i', 'H', 'H')
  vim.keymap.set('i', 'J', 'J')
  vim.keymap.set('i', 'K', 'K')
  vim.keymap.set('i', 'L', 'L')
  vim.keymap.set('i', ':', 'Ö')
  vim.keymap.set('i', '"', 'Ä')
  vim.keymap.set('i', 'Z', 'Y')
  vim.keymap.set('i', 'X', 'X')
  vim.keymap.set('i', 'C', 'C')
  vim.keymap.set('i', 'V', 'V')
  vim.keymap.set('i', 'B', 'B')
  vim.keymap.set('i', 'N', 'N')
  vim.keymap.set('i', 'M', 'M')
  vim.keymap.set('i', '<', ';')
  vim.keymap.set('i', '>', ':')
  vim.keymap.set('i', '?', '_')
  vim.keymap.set('i', '~', '°')
  vim.keymap.set('i', '!', '!')
  vim.keymap.set('i', '@', '"')
  vim.keymap.set('i', '#', '§')
  vim.keymap.set('i', '$', '$')
  vim.keymap.set('i', '%', '%')
  vim.keymap.set('i', '^', '&')
  vim.keymap.set('i', '&', '/')
  vim.keymap.set('i', '*', '(')
  vim.keymap.set('i', '(', ')')
  vim.keymap.set('i', ')', '=')
  vim.keymap.set('i', '_', '?')
end

vim.keymap.set("n", "<leader>ig", function()
  map_german_insert()
  vim.keymap.set('i', '<C-[>', function() 
    unmap_insert()
    vim.keymap.set('i', '<C-[>', '<C-[>')
    vim.cmd.stopinsert()
  end)
  vim.cmd.startinsert()
end)

function map_arabic_insert()
  vim.keymap.set('i', 'q', 'ض')
  vim.keymap.set('i', 'w', 'ص')
  vim.keymap.set('i', 'e', 'ث')
  vim.keymap.set('i', 'r', 'ق')
  vim.keymap.set('i', 't', 'ف')
  vim.keymap.set('i', 'y', 'غ')
  vim.keymap.set('i', 'u', 'ع')
  vim.keymap.set('i', 'i', 'ه')
  vim.keymap.set('i', 'o', 'خ')
  vim.keymap.set('i', 'p', 'ح')
  vim.keymap.set('i', '[', 'ج')
  vim.keymap.set('i', ']', 'د')
  vim.keymap.set('i', '\\', '\\')
  vim.keymap.set('i', 'a', 'ش')
  vim.keymap.set('i', 's', 'س')
  vim.keymap.set('i', 'd', 'ي')
  vim.keymap.set('i', 'f', 'ب')
  vim.keymap.set('i', 'g', 'ل')
  vim.keymap.set('i', 'h', 'ا')
  vim.keymap.set('i', 'j', 'ت')
  vim.keymap.set('i', 'k', 'ن')
  vim.keymap.set('i', 'l', 'م')
  vim.keymap.set('i', ';', 'ك')
  vim.keymap.set('i', "'", 'ط')
  vim.keymap.set('i', 'z', 'ئ')
  vim.keymap.set('i', 'x', 'ء')
  vim.keymap.set('i', 'c', 'ؤ')
  vim.keymap.set('i', 'v', 'ر')
  vim.keymap.set('i', 'b', 'b')
  vim.keymap.set('i', 'n', 'ى')
  vim.keymap.set('i', 'm', 'ة')
  vim.keymap.set('i', ',', 'و')
  vim.keymap.set('i', '.', 'ز')
  vim.keymap.set('i', '/', 'ظ')
  vim.keymap.set('i', '`', 'ذ')
  vim.keymap.set('i', '1', '1')
  vim.keymap.set('i', '2', '2')
  vim.keymap.set('i', '3', '3')
  vim.keymap.set('i', '4', '4')
  vim.keymap.set('i', '5', '5')
  vim.keymap.set('i', '6', '6')
  vim.keymap.set('i', '7', '7')
  vim.keymap.set('i', '8', '8')
  vim.keymap.set('i', '9', '9')
  vim.keymap.set('i', '0', '0')
  vim.keymap.set('i', '-', '-')
  vim.keymap.set('i', '=', '=')
  vim.keymap.set('i', 'Q', '')
  vim.keymap.set('i', 'W', '')
  vim.keymap.set('i', 'E', '')
  vim.keymap.set('i', 'R', '')
  vim.keymap.set('i', 'T', '')
  vim.keymap.set('i', 'Y', 'إ')
  vim.keymap.set('i', 'U', '‘')
  vim.keymap.set('i', 'I', '÷')
  vim.keymap.set('i', 'O', '×')
  vim.keymap.set('i', 'P', '؛')
  vim.keymap.set('i', '{', '<')
  vim.keymap.set('i', '}', '>')
  vim.keymap.set('i', '|', '|')
  vim.keymap.set('i', 'A', '')
  vim.keymap.set('i', 'S', '')
  vim.keymap.set('i', 'D', ']')
  vim.keymap.set('i', 'F', '[')
  vim.keymap.set('i', 'G', ' ')
  vim.keymap.set('i', 'H', 'أ')
  vim.keymap.set('i', 'J', 'ـ')
  vim.keymap.set('i', 'K', '،')
  vim.keymap.set('i', 'L', '/')
  vim.keymap.set('i', ':', ':')
  vim.keymap.set('i', '"', '"')
  vim.keymap.set('i', 'Z', '~')
  vim.keymap.set('i', 'X', '')
  vim.keymap.set('i', 'C', '}')
  vim.keymap.set('i', 'V', '{')
  vim.keymap.set('i', 'B', ' ')
  vim.keymap.set('i', 'N', 'آ')
  vim.keymap.set('i', 'M', '’')
  vim.keymap.set('i', '<', ',')
  vim.keymap.set('i', '>', '.')
  vim.keymap.set('i', '?', '؟')
  vim.keymap.set('i', '~', '')
  vim.keymap.set('i', '!', '!')
  vim.keymap.set('i', '@', '@')
  vim.keymap.set('i', '#', '#')
  vim.keymap.set('i', '$', '$')
  vim.keymap.set('i', '%', '%')
  vim.keymap.set('i', '^', '^')
  vim.keymap.set('i', '&', '&')
  vim.keymap.set('i', '*', '*')
  vim.keymap.set('i', '(', ')')
  vim.keymap.set('i', ')', '(')
  vim.keymap.set('i', '_', '_')
  vim.keymap.set('i', '+', '+')
end

vim.keymap.set("n", "<leader>ia", function()
  map_arabic_insert()
  vim.keymap.set('i', '<C-[>', function() 
    unmap_insert()
    vim.keymap.set('i', '<C-[>', '<C-[>')
    vim.cmd.stopinsert()
  end)
  vim.cmd.startinsert()
end)


-- [[ Basic Autocommands ]].
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd({"BufWinLeave"}, {
  pattern = {"*.*"},
  desc = "save view (folds), when closing file",
  command = "mkview",
})
vim.api.nvim_create_autocmd({"BufWinEnter"}, {
  pattern = {"*.*"},
  desc = "load view (folds), when opening file",
  command = "silent! loadview"
})

-- vim.api.nvim_create_autocmd("TermOpen", {
--   group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
--   callback = function()
--     vim.opt.number = false
--     vim.opt.relativenumber = false
--   end,
-- })

local quake_terminal_job_id = 0
function open_quake_terminal()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("K")
  vim.api.nvim_win_set_height(0, 5)
  vim.cmd.normal("i")

  quake_terminal_job_id = vim.bo.channel
end

vim.keymap.set("n", "<leader>to", open_quake_terminal)

local current_command = ""
vim.keymap.set("n", "<leader>te", function()
  current_command = vim.fn.input("Command: ", current_command)
end)

vim.keymap.set("n", "<leader>tr", function()
  if current_command == "" then
    current_command = vim.fn.input("Command: ")
  end

  vim.fn.chansend(quake_terminal_job_id, { current_command, '' })
end)

-- [[ Create user commands ]]
-- See `:h nvim_create_user_command()` and `:h user-commands`

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.fn.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }))
end, { desc = 'Print the git blame for the current line' })

-- [[ Add optional packages ]]
-- Nvim comes bundled with a set of packages that are not enabled by
-- default. You can enable any of them by using the `:packadd` command.

-- For example, to add the "nohlsearch" package to automatically turn off search highlighting after
-- 'updatetime' and when going to insert mode
vim.cmd('packadd! nohlsearch')


if vim.g.neovide then
    vim.g.neovide_scale_factor = 1.0
    local change_scale_factor = function(delta)
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
    end
    vim.keymap.set("n", "<C-=>", function()
      change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-->", function()
      change_scale_factor(1/1.25)
    end)
    vim.keymap.set("n", "<C-kPlus>", function()
      change_scale_factor(1.25)
    end)
    vim.keymap.set("n", "<C-kMinus>", function()
      change_scale_factor(1/1.25)
    end)
    vim.keymap.set("n", "<C-ScrollWheelUp>", function()
      change_scale_factor(1.10)
    end)
    vim.keymap.set("n", "<C-ScrollWheelDown>", function()
      change_scale_factor(1/1.10)
    end)
end
