{
  extraConfigLuaPre = '''';

  extraConfigLua = ''
    -- highlight trailing whitespace
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#ff0000" })
    vim.api.nvim_create_autocmd("ColorScheme", {
      callback = function()
        -- reapply highlight if colorscheme changes
        vim.api.nvim_set_hl(0, "TrailingWhitespace", { bg = "#ff0000" })
      end,
    })
    vim.fn.matchadd("TrailingWhitespace", "\\s\\+$")

    -- remove trailing whitespace on save
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*",
      callback = function()
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
      end,
    })
  '';

  extraConfigLuaPost = '''';


}
