{
  colorschemes.oxocarbon.enable = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    fileencoding = "utf-8";
    number = true;
    relativenumber = true;
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    breakindent = true;
    undofile = true;
    signcolumn = "yes";
    wrap = true;
    linebreak = true;
    textwidth = 0;
    timeoutlen = 300;
    splitbelow = true;
    splitright = true;
    list = true;
    listchars = {
      tab = "▸ ";
      trail = "·";
      eol = "↵";
      space = "·";
    };
    inccommand = "split";
    cursorline = true;
    scrolloff = 8;

    clipboard = {
      providers.wl-copy.enable = true;
      register = "wl-copy";
    };
  };

  diagnostic.settings = {
    virtual_text = {
      severity.__raw = "vim.diagnostic.severity.WARN";
    };
    virtual_lines = {
      severity.__raw = "vim.diagnostic.severity.ERROR";
    };
    signs = true;
    underline = true;
    float = {
      wrap = true;
      max_width = 80;
      source = "always";
      border = "rounded";
    };
  };
}
