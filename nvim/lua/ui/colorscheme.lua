local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

if not ok_status then
  return
end

-- Default Setting for NeoSolarized

NeoSolarized.setup {
  style = "dark", -- "dark" or "light"
  transparent = true, -- true/false
  terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
  enable_italics = false, -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
  styles = {
    -- Style for different style groups
    comments = { italic = true },
    keywords = { italic = false },
    functions = { bold = true },
    variables = {},
    string = { italic = false },
    underline = true, -- true/false; for global underline
    undercurl = true, -- true/false; for global undercurl
  },
}
-- Set colorscheme to NeoSolarized
vim.cmd [[colorscheme NeoSolarized]]
