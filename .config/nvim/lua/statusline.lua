-- vi: expandtab ts=2 sw=2

local fn = vim.fn
local api = vim.api
local cmd = vim.cmd

local M = {}

-- highlight groups
M.colors = {
  active        = '%#StatusLine#',
  inactive      = '%#StatuslineNC#',
  mode          = '%#Mode#',
  git           = '%#Git#',
  file          = '%#File#',
  lsp           = '%#Lsp#',
  filetype      = '%#Filetype#',
  line_col      = '%#LineCol#',
  perc          = '%#Percentage#',
  char          = '%#Char#',
}

M.trunc_width = setmetatable({
  mode       = 90,
  git_status = 90,
  filename   = 140,
  line_col   = 60,
}, {
  __index = function()
    return 80
  end
})

M.is_truncated = function(_, width)
  local current_width = api.nvim_win_get_width(0)
  return current_width < width
end

M.modes = setmetatable({
  ['n']  = {'Normal', 'N'};
  ['no'] = {'N-Pending', 'N-P'} ;
  ['v']  = {'Visual', 'V' };
  ['V']  = {'V-Line', 'V-L' };
  [''] = {'V-Block', 'V-B'}; -- this is not ^V, but it's , they're different
  ['s']  = {'Select', 'S'};
  ['S']  = {'S-Line', 'S-L'};
  [''] = {'S·Block', 'S-B'}; -- same with this one, it's not ^S but it's 
  ['i']  = {'Insert', 'I'};
  ['ic'] = {'Insert', 'I'};
  ['R']  = {'Replace', 'R'};
  ['Rv'] = {'V-Replace', 'V-R'};
  ['c']  = {'Command', 'C'};
  ['cv'] = {'Vim-Ex ', 'V-E'};
  ['ce'] = {'Ex ', 'E'};
  ['r']  = {'Prompt ', 'P'};
  ['rm'] = {'More ', 'M'};
  ['r?'] = {'Confirm ', 'C'};
  ['!']  = {'Shell ', 'S'};
  ['t']  = {'Terminal ', 'T'};
}, {
  __index = function()
    return {'Unknown', 'U'} -- handle edge cases
  end
})

M.get_current_mode = function(self)
  local current_mode = api.nvim_get_mode().mode

  if self:is_truncated(self.trunc_width.mode) then
    return string.format(' %s ', self.modes[current_mode][2]):upper()
  end

  return string.format(' %s ', self.modes[current_mode][1]):upper()
end

M.get_git_status = function(self)
  -- use fallback because it doesn't set this variable on the initial `BufEnter`
  local signs = vim.b.gitsigns_status_dict or {head = '', added = 0, changed = 0, removed = 0}
  local is_head_empty = signs.head ~= ''

  if self:is_truncated(self.trunc_width.git_status)
      or ( signs.added == nil and signs.changed == nil and signs.removed == nil ) then
    return is_head_empty and string.format('  %s ', signs.head or '') or ''
  end

  return is_head_empty and string.format(
    ' +%s ~%s -%s |  %s ',
    signs.added, signs.changed, signs.removed, signs.head
  ) or ''
end

M.get_filename = function(self)
  return ' %<%f '
end

M.get_filetype = function()

  local file_name, file_ext = fn.expand('%:t'), fn.expand('%:e')
  local icon = require'nvim-web-devicons'.get_icon(file_name, file_ext, { default = true })
  local filetype = vim.bo.filetype

  if filetype == '' or filetype == nil then
    return ''
  elseif icon == '' or icon == nil then
    return string.format(' %s ', filetype):lower()
  end

  return string.format(' %s %s ', icon, filetype):lower()
end

M.get_character = function(self)
  if self:is_truncated(self.trunc_width.line_col) then
    return ''
  end

  return ' 0x%04B '
end

M.get_line_col = function(self)
  if self:is_truncated(self.trunc_width.line_col) then
    return ' %l:%c '
  end

  return ' Ln %l, Col %c '
end

M.get_lsp_diagnostic = function(self)
  local result = {}
  local levels = {
    errors = 'Error',
    warnings = 'Warning',
    info = 'Information',
    hints = 'Hint'
  }

  for k, level in pairs(levels) do
    result[k] = vim.lsp.diagnostic.get_count(0, level)
  end

  if self:is_truncated(120) then
    return ''
  else
    return string.format(
      ' :%s :%s :%s :%s ',
      result['errors'] or 0, result['warnings'] or 0,
      result['info'] or 0, result['hints'] or 0
    )
  end
end

M.set_active = function(self)
  local colors = self.colors

  cmd('hi Mode ctermfg=Black ctermbg=Yellow')
  cmd('hi Git ctermfg=Black ctermbg=DarkGray')
  cmd('hi File ctermfg=DarkGray')
  cmd('hi Lsp ctermbg=LightMagenta ctermfg=Black')
  cmd('hi FileType ctermbg=LightBlue ctermfg=Black')
  cmd('hi LineCol ctermbg=DarkBlue ctermfg=Black')
  cmd('hi Percentage ctermbg=Red ctermfg=White')
  cmd('hi Char ctermbg=Yellow ctermfg=Black')

  return table.concat({
    colors.active,
    colors.mode .. self:get_current_mode(),
    colors.git .. self:get_git_status(),
    colors.file .. self:get_filename(),
    '%=',
    colors.lsp .. self:get_lsp_diagnostic(),
    colors.filetype .. self:get_filetype(),
    colors.line_col .. self:get_line_col(),
    colors.perc .. ' %p%% ',
    colors.char .. self:get_character(),
  })
end

M.set_inactive = function(self)
  return self.colors.inactive .. '%= %F %='
end

M.set_explorer = function(self)
  local title = self.colors.mode .. '   '

  return table.concat({ self.colors.active, title })
end

Statusline = setmetatable(M, {
  __call = function(statusline, mode)
    if mode == 'active' then return statusline:set_active() end
    if mode == 'inactive' then return statusline:set_inactive() end
    if mode == 'explorer' then return statusline:set_explorer() end
  end
})

api.nvim_exec([[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline('active')
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline('inactive')
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline('explorer')
  augroup END
]], false)
