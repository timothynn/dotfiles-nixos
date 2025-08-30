{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    # Extra system packages required for LSP, formatters, debuggers
    extraPackages = with pkgs; [
      # LSP servers
      nodePackages.pyright
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted # html, css
      rust-analyzer
      nixd
      scala-cli # for Metals (Scala LSP bootstrap)
      lua-language-server

      # Linters / formatters
      black
      isort
      prettier
      stylua

      # Debuggers
      delve   # Go
      lldb    # C, C++, Rust
      nodePackages."@vscode/debugadapter"
    ];

    # Plugged-in config
    plugins = with pkgs.vimPlugins; [
      # Theme / UI
      tokyonight-nvim
      lualine-nvim
      bufferline-nvim
      nvim-web-devicons
      nvim-tree-lua
      gitsigns-nvim

      # Syntax / Editing
      nvim-treesitter.withAllGrammars
      telescope-nvim
      telescope-fzf-native-nvim
      which-key-nvim
      comment-nvim
      autopairs-nvim

      # LSP / Dev
      nvim-lspconfig
      mason-nvim
      mason-lspconfig-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      luasnip
      friendly-snippets

      # Formatting & linting
      conform-nvim
      nvim-lint

      # Debugging
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
    ];

    # Your Lua config
    extraLuaConfig = ''
      -- =======================
      -- Obsidian Green Theme
      -- =======================
      vim.cmd.colorscheme("tokyonight")
      vim.g.tokyonight_style = "night"
      vim.g.tokyonight_colors = { bg = "#1b1b1b", fg = "#d1d5d4", green = "#00ff66" }

      -- UI plugins
      require("lualine").setup {
        options = {
          theme = "tokyonight",
          section_separators = { "", "" },
          component_separators = { "", "" },
        }
      }

      require("bufferline").setup{}
      require("nvim-tree").setup{}
      require("gitsigns").setup{}

      -- =======================
      -- Telescope
      -- =======================
      local telescope = require("telescope")
      telescope.setup {
        defaults = {
          prompt_prefix = "   ",
          selection_caret = "❯ ",
        }
      }

      -- =======================
      -- Treesitter
      -- =======================
      require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        highlight = { enable = true },
        indent = { enable = true }
      }

      -- =======================
      -- Autopairs & Comment
      -- =======================
      require("nvim-autopairs").setup{}
      require("Comment").setup{}

      -- =======================
      -- LSP Config (with Mason)
      -- =======================
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "pyright", "tsserver", "cssls", "html",
          "rust_analyzer", "nixd", "metals", "lua_ls"
        }
      }

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "pyright", "tsserver", "cssls", "html", "rust_analyzer", "nixd", "metals", "lua_ls" }
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup { capabilities = capabilities }
      end

      -- =======================
      -- Completion (nvim-cmp)
      -- =======================
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup {
        snippet = {
          expand = function(args) luasnip.lsp_expand(args.body) end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
      }

      -- =======================
      -- Linters & Formatters
      -- =======================
      require("conform").setup({
        formatters_by_ft = {
          python = { "black", "isort" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          lua = { "stylua" },
        }
      })

      require("lint").linters_by_ft = {
        python = { "flake8" },
        javascript = { "eslint" },
        typescript = { "eslint" },
      }

      -- =======================
      -- Debugging (DAP)
      -- =======================
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      require("nvim-dap-virtual-text").setup()

      -- Python Debugger
      dap.adapters.python = {
        type = "executable";
        command = "python";
        args = { "-m", "debugpy.adapter" };
      }
      dap.configurations.python = {
        {
          type = "python";
          request = "launch";
          name = "Launch file";
          program = "${file}";
        },
      }

      -- Node/TS Debugger
      dap.adapters.node2 = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js" }
      }
      dap.configurations.javascript = {
        {
          type = "node2";
          request = "launch";
          program = "${file}";
          cwd = vim.fn.getcwd();
        }
      }
      dap.configurations.typescript = dap.configurations.javascript
    '';
  };
}

