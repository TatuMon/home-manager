[
  {
    action = "<cmd>w<cr>";
    key = "<C-s>";
    mode = "n";
    options.desc = "Quick save";
  }
  {
    action = "<cmd>noh<cr>";
    key = "<C-n>";
    mode = "n";
    options.desc = "Stop find";
  }
  {
    action = "\"+y";
    key = "<leader>y";
    mode = ["n" "v"];
    options.desc = "Yank to clipboard";
  }
  {
    action = "\"+Y";
    key = "<leader>Y";
    mode = ["n" "v"];
    options.desc = "Capital yank to clipboard (no idea, I copied it from my old config)";
  }
  {
    action = ":m '>+1<CR>gv=gv";
    key = "J";
    mode = ["v"];
    options.desc = "Move block downwards";
  }
  {
    action = ":m '<-2<CR>gv=gv";
    key = "K";
    mode = ["v"];
    options.desc = "Move block upwards";
  }
]
