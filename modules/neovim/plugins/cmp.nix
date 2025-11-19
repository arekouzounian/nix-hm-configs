{
  plugins.cmp = {
    enable = true;
    settings = {
      sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
      ];

      mapping = {
	"<Tab>" = "cmp.mapping.select_next_item()";
	"<S-Tab>" = "cmp.mapping.select_prev_item()";
	"<C-t>" = "cmp.mapping.confirm({ select = true })";
      };
    };
  };
}
