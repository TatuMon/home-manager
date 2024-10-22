# Nixvim manual: https://nix-community.github.io/nixvim/
pkgs: {
  enable = true;
  colorschemes.nord.enable = true;
  clipboard.providers.xclip.enable = true;

  globals = { mapleader = " "; };
  opts = {
    number = true;
    relativenumber = true;
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    smartindent = true;
    wrap = false;
    hlsearch = true;
    incsearch = true;
    termguicolors = true;
    scrolloff = 8;
    signcolumn = "yes";
    updatetime = 50;
    colorcolumn = "80";
  };

  keymaps = import ./keymaps/keymaps.nix;

  userCommands = import ./userCommands;

  extraPlugins = [{
    plugin = pkgs.vimPlugins.outline-nvim;
    config = "lua require('outline').setup({})";
  }];

  plugins = {
    treesitter.enable = true;

    twilight.enable = true;
    barbar.enable = true;

    ts-context-commentstring.enable = true;
    comment.enable = true;

    transparent.enable = true;

    lsp = {
      enable = true;
      servers = {
        nil-ls.enable = true; # Nix
        intelephense.enable = true; # PHP
        gopls.enable = true; # Go
        golangci-lint-ls.enable = true; # Golanci-lint
        rust-analyzer = {
          enable = true;
          installCargo = true;
          installRustc = true;
        };
        pylsp.enable = true; # Python
        omnisharp.enable = true; # .NET
        nginx-language-server.enable = true; # Nginx
        lua-ls.enable = true; # Lua
        sqls.enable = true; # SQL
        eslint.enable = true; # HTML, CSS, JSON and JS/TS
        tailwindcss.enable = true; # Tailwindcss
        yamlls.enable = true; # YAML
        bashls.enable = true; # Bash
        ccls.enable = true; # C/C++/Obj.C
        cmake.enable = true; # CMake
        dockerls.enable = true; # Dockerfile
      };
    };

    none-ls = {
      enable = true;
      sources.formatting = { nixfmt.enable = true; };
    };

    lint.enable = true;

    cmp = {
      enable = true;
      settings = {
        mapping = {
          __raw = ''
            cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }),
            })
          '';
        };
        snippet = {
          expand =
            "function(args) require('luasnip').lsp_expand(args.body) end";
        };
        sources = {
          __raw = ''
            cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'vsnip' },
              -- { name = 'luasnip' },
              -- { name = 'ultisnips' },
              -- { name = 'snippy' },
            }, {
              { name = 'buffer' },
            })
          '';
        };
        window = {
          completion = { __raw = "cmp.config.window.bordered()"; };
          documentation = { __raw = "cmp.config.window.bordered()"; };
        };
      };
    };

    cmp-nvim-lsp = { enable = true; };

    barbecue = { enable = true; };

    lualine = { enable = true; };

    markdown-preview = { enable = true; };

    neoscroll = { enable = true; };

    nvim-autopairs = { enable = true; };

    nvim-tree = { enable = true; };

    telescope = { enable = true; };

    undotree = { enable = true; };

    dashboard = { enable = true; };

    gitblame.enable = true;
    gitsigns.enable = true;

    lazygit = { enable = true; };

    which-key.enable = true;
    trouble.enable = true;
    indent-o-matic.enable = true;
    indent-blankline.enable = true;

    dap = {
      enable = true;
      extensions = {
        dap-go.enable = true;
        dap-python.enable = true;
        dap-virtual-text.enable = true;
        dap-ui.enable = true;
      };
      signs = {
        dapBreakpoint.text = "🛑";
        dapStopped.text = "▶";
        dapBreakpointRejected.text = "🚫";
        dapBreakpointCondition.text = "❓";
        dapLogPoint.text = "💬";
      };
      configurations = {
        php = [{
          type = "php";
          request = "attach";
          name = "Listen for XDebug";
          port = 9003;
        }];
      };
    };
    cmp-dap.enable = true;
  };
}
