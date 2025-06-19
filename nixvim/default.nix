# Nixvim manual: https://nix-community.github.io/nixvim/
pkgs: {
  enable = true;
  colorschemes.tokyonight = {
    enable = true;
    settings = { style = "storm"; };
  };
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
    colorcolumn = "100";
  };

  keymaps = import ./keymaps/keymaps.nix;

  userCommands = import ./userCommands;

  extraPlugins = with pkgs.vimPlugins; [
    {
      plugin = outline-nvim;
      config = "lua require('outline').setup({})";
    }
    {
      plugin = nvim-scrollbar;
      config = "lua require('scrollbar').setup({})";
    }
  ];

  plugins = {
    vimwiki.enable = true;

    web-devicons.enable = true;

    treesitter.enable = true;

    twilight.enable = true;
    barbar.enable = true;

    ts-context-commentstring.enable = true;
    comment.enable = true;

    transparent.enable = true;

    lsp = {
      enable = true;
      servers = {
        nil_ls.enable = true; # Nix
        intelephense = { # PHP
          enable = true;
          package = pkgs.intelephense;
        };
        gopls.enable = true; # Go
        # golangci-lint-ls.enable = true; # Golanci-lint
        rust_analyzer = { # Rust
          enable = true;
          installCargo = false;
          installRustc = false;
        };
        pylsp.enable = true; # Python
        omnisharp.enable = true; # .NET
        nginx_language_server.enable = true; # Nginx
        lua_ls.enable = true; # Lua
        sqls.enable = true; # SQL
        eslint.enable = true; # HTML, CSS, JSON
        tailwindcss.enable = true; # Tailwindcss
        yamlls.enable = true; # YAML
        bashls.enable = true; # Bash
        clangd.enable = true; # C/C++
        cmake.enable = true; # CMake
        dockerls.enable = true; # Dockerfile
        elixirls.enable = true; # Elixir
        terraformls.enable = true; # Terraform
        lemminx.enable = true; # XML
      };
      postConfig = ''
        local _border = "rounded"

        vim.o.winborder = _border

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
          vim.lsp.handlers.hover, {
            border = _border
          }
        )

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
          vim.lsp.handlers.signature_help, {
            border = _border
          }
        )

        vim.diagnostic.config{
          float={border=_border},
          virtual_text=true,
        };

        require('lspconfig.ui.windows').default_options = {
          border = _border
        }
      '';
    };

    typescript-tools.enable = true;

    none-ls = {
      enable = true;
      sources.formatting = { nixfmt.enable = true; };
    };

    lint.enable = true;

    luasnip.enable = true;

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
        sources = [
          { name = "nvim_lsp"; }
          { name = "vsnip"; }
          { name = "luasnip"; }
          { name = "buffer"; }
        ];
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

    nvim-autopairs = { enable = true; };

    neo-tree = {
      enable = true;
      buffers = {
        followCurrentFile = {
          enabled = true;
          leaveDirsOpen = true;
        };
      };
    };

    telescope = { enable = true; };

    undotree = { enable = true; };

    dashboard = { enable = true; };

    gitsigns = {
      enable = true;
      settings.current_line_blame = true;
    };

    lazygit = { enable = true; };

    which-key.enable = true;
    trouble.enable = true;
    indent-o-matic.enable = true;
    indent-blankline.enable = true;

    dap-go.enable = true;
    dap-python.enable = true;
    dap-virtual-text.enable = true;
    dap-ui.enable = true;
    dap = {
      enable = true;
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

  autoCmd = [
    {
      command = "set filetype=hyprlang";
      event = [ "BufRead" "BufNewFile"  ];
      pattern = [ "hyprland/*.conf" "hypr/*.conf" ];
    }
  ];
}
