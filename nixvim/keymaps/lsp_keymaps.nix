[
  {
    action = "<cmd>lua vim.lsp.buf.definition()<cr>";
    key = "gd";
    mode = "n";
    options.desc = "Go to definition";
  }
  {
    action = "<cmd>lua vim.lsp.buf.hover()<cr>";
    key = "K";
    mode = "n";
    options.desc = "Hover";
  }
  {
    action = "<cmd>lua vim.lsp.buf.rename()<cr>";
    key = "<leader>rs";
    mode = "n";
    options.desc = "Rename symbol";
  }
  {
    action = "<cmd>lua vim.lsp.buf.format()<cr>";
    key = "<leader>lf";
    mode = "n";
    options.desc = "Format buffer";
  }
  {
    action = "<cmd>lua vim.lsp.buf.references()<cr>";
    key = "<leader>vr";
    mode = "n";
    options.desc = "View symbol references";
  }
  {
    action = "<cmd>lua vim.lsp.buf.signature_help()<cr>";
    key = "<C-h>";
    mode = ["n" "i"];
    options.desc = "Show signature help";
  }
  {
    action = "<cmd>LspRestart<cr>";
    key = "<leader>lr";
    mode = "n";
    options.desc = "Restart LSP";
  }
]
