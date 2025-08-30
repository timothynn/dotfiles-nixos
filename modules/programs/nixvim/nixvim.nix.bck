{ config, pkgs, nixvim, ... }:

{
  programs.nixvim = {
    enable = true;

    # Theme and appearance
    colorscheme = "catppuccin";
    colorschemes.catppuccin = {
      enable = true;
      flavour = "mocha"; # latte, frappe, macchiato, mocha
      lazyLoad.enable = true;
    };

    # Plugins
    plugins = {
      treesitter = {
        enable = true;
        ensureInstalled = "all";
        highlight.enable = true;
        indent.enable = true;
      };

      lualine.enable = true;

      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
        };
      };

      nvim-tree.enable = true;

      gitsigns.enable = true;

      which-key.enable = true;

      # Autocompletion
      nvim-cmp = {
        enable = true;
        sources = [ "nvim_lsp" "buffer" "path" "luasnip" ];
      };

      luasnip.enable = true;

      # LSP
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          pyright.enable = true;
          rust-analyzer.enable = true;
          gopls.enable = true;
          lua-ls.enable = true;
          nil-ls.enable = true; # for nix
        };
      };

      # UI Enhancements
      bufferline.enable = true;
      indent-blankline.enable = true;
      todo-comments.enable = true;
      toggleterm.enable = true;
    };

    # Extra Lua config
    extraLuaConfig = ''
      -- Telescope shortcuts
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      -- NvimTree toggle
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {})

      -- LSP keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
    '';

    # Options (same as `:set`)
    options = {
      number = true;
      relativenumber = true;
      shiftwidth = 2;
      tabstop = 2;
      expandtab = true;
      smartindent = true;
      termguicolors = true;
      cursorline = true;
      ignorecase = true;
      smartcase = true;
      clipboard = "unnamedplus";
      signcolumn = "yes";
    };

    # Key mappings
    keymaps = [
      {
        mode = "n";
        key = "<leader>qq";
        action = ":q<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>w";
        action = ":w<CR>";
        options.silent = true;
      }
    ];
  };
}

