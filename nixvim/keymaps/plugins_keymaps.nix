# <leader> is defined where the nixvim plugin is enabled
let
  requireDapRaw = "require('dap')";
  requireDapUIRaw = "require('dapui')";
  terminateDebugRaw = ''
    function()
      ${requireDapRaw}.terminate()
      ${requireDapUIRaw}.close()
      ${requireDapRaw}.clear_breakpoints()
    end
  '';
in
[
  # NvimTree
  {
    action = "<cmd>Neotree<cr>";
    key = "<leader>bb";
    mode = "n";
    options.desc = "Toggle file tree";
  }
  {
    action = "<cmd>NvimTreeRefresh<cr>";
    key = "<leader>br";
    mode = "n";
    options.desc = "Refresh file tree";
  }
  # Telescope
  {
    action = "<cmd>Telescope find_files<cr>";
    key = "<C-p>";
    mode = "n";
    options.desc = "Find files";
  }
  {
    action = "<cmd>Telescope live_grep<cr>";
    key = "<C-l>";
    mode = "n";
    options.desc = "Grep files";
  }
  # Undotree
  {
    action = "<cmd>UndoTreeToggle<cr>";
    key = "<leader>u";
    mode = "n";
    options.desc = "Toggle undo-tree";
  }
  # Lazygit
  {
    action = "<cmd>LazyGit<cr>";
    key = "<leader><leader>";
    mode = "n";
    options.desc = "Open Lazygit";
  }
  # Barbar
  {
    action = "<cmd>BufferPin<cr>";
    key = "<leader>p";
    mode = "n";
    options.desc = "Pin buffer";
  }
  {
    action = "<cmd>BufferClose<cr>";
    key = "<leader>c";
    mode = "n";
    options.desc = "Close buffer";
  }
  {
    action = "<cmd>BufferCloseAllButCurrentOrPinned<cr>";
    key = "<leader>kw";
    mode = "n";
    options.desc = "Close buffers except current and pinned ones";
  }
  {
    action = "<cmd>BufferPrevious<cr>";
    key = "<leader>,";
    mode = "n";
    options.desc = "Go to previous buffer";
  }
  {
    action = "<cmd>BufferNext<cr>";
    key = "<leader>.";
    mode = "n";
    options.desc = "Go to next buffer";
  }
  {
    action = "<cmd>BufferGoto 1<cr>";
    key = "<leader>1";
    mode = "n";
    options.desc = "Go to buffer 1";
  }
  {
    action = "<cmd>BufferGoto 2<cr>";
    key = "<leader>2";
    mode = "n";
    options.desc = "Go to buffer 2";
  }
  {
    action = "<cmd>BufferGoto 3<cr>";
    key = "<leader>3";
    mode = "n";
    options.desc = "Go to buffer 3";
  }
  {
    action = "<cmd>BufferGoto 4<cr>";
    key = "<leader>4";
    mode = "n";
    options.desc = "Go to buffer 4";
  }
  {
    action = "<cmd>BufferGoto 5<cr>";
    key = "<leader>5";
    mode = "n";
    options.desc = "Go to buffer 5";
  }
  {
    action = "<cmd>BufferGoto 6<cr>";
    key = "<leader>6";
    mode = "n";
    options.desc = "Go to buffer 6";
  }
  {
    action = "<cmd>BufferGoto 7<cr>";
    key = "<leader>7";
    mode = "n";
    options.desc = "Go to buffer 7";
  }
  {
    action = "<cmd>BufferGoto 8<cr>";
    key = "<leader>8";
    mode = "n";
    options.desc = "Go to buffer 8";
  }
  {
    action = "<cmd>BufferGoto 9<cr>";
    key = "<leader>9";
    mode = "n";
    options.desc = "Go to buffer 9";
  }
  {
    action = "<cmd>BufferLast<cr>";
    key = "<leader>0";
    mode = "n";
    options.desc = "Go to last buffer";
  }
  # DAP
  {
    action = "<cmd>DapContinue<cr>";
    key = "<leader>dd";
    mode = "n";
    options.desc = "Continue debugging";
  }
  {
    action = "<cmd>DapToggleBreakpoint<cr>";
    key = "<leader>dbp";
    mode = "n";
    options.desc = "Toggle debugging breakpoint";
  }
  {
    action = "<cmd>DapStepInto<cr>";
    key = "<leader>dl";
    mode = "n";
    options.desc = "Step into";
  }
  {
    action = "<cmd>DapStepOver<cr>";
    key = "<leader>dj";
    mode = "n";
    options.desc = "Step over";
  }
  {
    action = "<cmd>DapStepOut<cr>";
    key = "<leader>dk";
    mode = "n";
    options.desc = "Step out";
  }
  {
    action = { __raw = "${requireDapUIRaw}.toggle"; };
    key = "<leader>du";
    mode = "n";
    options.desc = "Toggle DAP UI";
  }
  {
    action = { __raw = terminateDebugRaw; };
    key = "<leader>d";
    mode = "n";
    options.desc = "Terminate debugging";
  }
  # Outline
  {
    action = "<cmd>Outline<cr>";
    key = "<leader>sm";
    mode = "n";
    options.desc = "Show buffer symbols";
  }
]
