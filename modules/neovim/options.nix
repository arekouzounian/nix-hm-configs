{
  colorschemes.nightfox.enable = true;

  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };

  opts = {
    fileencoding = "utf-8";
    number = true;
    relativenumber = true;
    shiftwidth = 2;
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
  };

  diagnostic.settings = {
    virtual_text = {
      wrap = true;
    };
    signs = {
      wrap = true;
    };
    underline = {
      wrap = true;
    };
    float = {
      wrap = true;
      source = "always";
    };
  };
}
