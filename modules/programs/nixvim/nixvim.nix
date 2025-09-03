{ config, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
      };
    };
    
    # # Global options
    # globals = {
    #   mapleader = " ";
    #   maplocalleader = ",";
    #   # Better search
    #   incsearch = true;
    #   hlsearch = true;
    #   ignorecase = true;
    #   smartcase = true;
    #   # Better editing
    #   expandtab = true;
    #   shiftwidth = 2;
    #   tabstop = 2;
    #   softtabstop = 2;
    #   autoindent = true;
    #   smartindent = true;
    #   # Better UI
    #   number = true;
    #   relativenumber = true;
    #   cursorline = true;
    #   signcolumn = "yes";
    #   colorcolumn = "80";
    #   # Better splits
    #   splitbelow = true;
    #   splitright = true;
    #   # Better file handling
    #   hidden = true;
    #   autoread = true;
    #   # Better completion
    #   completeopt = "menuone,noselect";
    #   # Better terminal
    #   termguicolors = true;
    # };

    # # Keymaps
    # keymaps = [
    #   # General navigation
    #   {
    #     mode = "n";
    #     key = "<C-h>";
    #     action = "<C-w>h";
    #     options.desc = "Navigate to left split";
    #   }
    #   {
    #     mode = "n";
    #     key = "<C-j>";
    #     action = "<C-w>j";
    #     options.desc = "Navigate to bottom split";
    #   }
    #   {
    #     mode = "n";
    #     key = "<C-k>";
    #     action = "<C-w>k";
    #     options.desc = "Navigate to top split";
    #   }
    #   {
    #     mode = "n";
    #     key = "<C-l>";
    #     action = "<C-w>l";
    #     options.desc = "Navigate to right split";
    #   }
    #   # File management
    #   {
    #     mode = "n";
    #     key = "<leader>e";
    #     action = "<cmd>NvimTreeToggle<CR>";
    #     options.desc = "Toggle file explorer";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>ff";
    #     action = "<cmd>Telescope find_files<CR>";
    #     options.desc = "Find files";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>fg";
    #     action = "<cmd>Telescope live_grep<CR>";
    #     options.desc = "Live grep";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>fb";
    #     action = "<cmd>Telescope buffers<CR>";
    #     options.desc = "Find buffers";
    #   }
    #   # LSP keymaps
    #   {
    #     mode = "n";
    #     key = "gd";
    #     action = "<cmd>lua vim.lsp.buf.definition()<CR>";
    #     options.desc = "Go to definition";
    #   }
    #   {
    #     mode = "n";
    #     key = "gr";
    #     action = "<cmd>lua vim.lsp.buf.references()<CR>";
    #     options.desc = "Go to references";
    #   }
    #   {
    #     mode = "n";
    #     key = "K";
    #     action = "<cmd>lua vim.lsp.buf.hover()<CR>";
    #     options.desc = "Show hover";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>ca";
    #     action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
    #     options.desc = "Code actions";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>rn";
    #     action = "<cmd>lua vim.lsp.buf.rename()<CR>";
    #     options.desc = "Rename symbol";
    #   }
    #   # DAP keymaps
    #   {
    #     mode = "n";
    #     key = "<leader>db";
    #     action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
    #     options.desc = "Toggle breakpoint";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>dc";
    #     action = "<cmd>lua require('dap').continue()<CR>";
    #     options.desc = "Continue/Start debugging";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>di";
    #     action = "<cmd>lua require('dap').step_into()<CR>";
    #     options.desc = "Step into";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>do";
    #     action = "<cmd>lua require('dap').step_over()<CR>";
    #     options.desc = "Step over";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>du";
    #     action = "<cmd>lua require('dap').step_out()<CR>";
    #     options.desc = "Step out";
    #   }
    #   # Git integration
    #   {
    #     mode = "n";
    #     key = "<leader>gs";
    #     action = "<cmd>Git<CR>";
    #     options.desc = "Git status";
    #   }
    #   {
    #     mode = "n";
    #     key = "<leader>gb";
    #     action = "<cmd>Git blame<CR>";
    #     options.desc = "Git blame";
    #   }
    # ];

    # # Plugins
    # plugins = {
    #   # Essential plugins
    #   nvim-tree = {
    #     enable = true;
    #     git.enable = true;
    #     renderer.icons.show.git = true;
    #   };
      
    #   telescope = {
    #     enable = true;
    #     extensions = {
    #       fzf-native.enable = true;
    #       file-browser.enable = true;
    #       project-nvim.enable = true;
    #     };
    #   };

    #   # LSP and completion
    #   lsp = {
    #     enable = true;
    #     servers = {
    #       # Python
    #       pyright = {
    #         enable = true;
    #         settings = {
    #           python.analysis = {
    #             typeCheckingMode = "basic";
    #             autoSearchPaths = true;
    #             useLibraryCodeForTypes = true;
    #           };
    #         };
    #       };
    #       # Rust
    #       rust-analyzer = {
    #         enable = true;
    #         settings = {
    #           rust-analyzer.checkOnSave.command = "clippy";
    #         };
    #       };
    #       # Go
    #       gopls = {
    #         enable = true;
    #         settings = {
    #           gopls.usePlaceholders = true;
    #           gopls.completeUnimported = true;
    #         };
    #       };
    #       # JavaScript/TypeScript
    #       tsserver = {
    #         enable = true;
    #         settings = {
    #           typescript.preferences.includePackageJsonAutoImports = "on";
    #         };
    #       };
    #       # SQL
    #       sqlls = {
    #         enable = true;
    #         package = null;
    #       };
    #       # YAML
    #       yamlls.enable = true;
    #       # JSON
    #       jsonls.enable = true;
    #       # Markdown
    #       marksman.enable = true;
    #       # Docker
    #       dockerls.enable = true;
    #       # Terraform
    #       terraformls.enable = true;
    #       # Nix
    #       nil_ls.enable = true;
    #     };
    #   };

    #   # Completion
    #   cmp = {
    #     enable = true;
    #     settings.sources = [
    #       { name = "nvim_lsp"; }
    #       { name = "nvim_lua"; }
    #       { name = "luasnip"; }
    #       { name = "buffer"; }
    #       { name = "path"; }
    #       { name = "git"; }
    #     ];
    #   };

    #   luasnip = {
    #     enable = true;
    #     fromVscode = [ 1 ];
    #   };

    #   # Treesitter for syntax highlighting
    #   treesitter = {
    #     enable = true;
    #     settings = {
    #       highlight = {
    #         enable = true;
    #         additional_vim_regex_highlighting = false;
    #       };
    #       indent = { enable = true; };
    #       ensure_installed = [
    #         "python"
    #         "rust"
    #         "go"
    #         "javascript"
    #         "typescript"
    #         "tsx"
    #         "json"
    #         "yaml"
    #         "toml"
    #         "sql"
    #         "markdown"
    #         "dockerfile"
    #         "terraform"
    #         "nix"
    #         "bash"
    #         "lua"
    #         "vim"
    #       ];
    #     };
    #   };

    #   # Git integration
    #   gitsigns = {
    #     enable = true;
    #     settings = {
    #       signs = {
    #         add = { text = "+"; };
    #         change = { text = "~"; };
    #         delete = { text = "_"; };
    #         topdelete = { text = "‾"; };
    #         changedelete = { text = "~"; };
    #       };
    #     };
    #   };

    #   # Status line
    #   lualine = {
    #     enable = true;
    #     theme = "auto";
    #     sections = {
    #       lualine_a = [ "mode" ];
    #       lualine_b = [ "branch" "diff" "diagnostics" ];
    #       lualine_c = [ "filename" ];
    #       lualine_x = [ "encoding" "filetype" ];
    #       lualine_y = [ "progress" ];
    #       lualine_z = [ "location" ];
    #     };
    #   };

    #   # Buffer line
    #   bufferline = {
    #     enable = true;
    #     settings.options = {
    #       diagnostics = "nvim_lsp";
    #       always_show_bufferline = false;
    #       show_buffer_close_icons = true;
    #       show_close_icon = false;
    #       color_icons = true;
    #     };
    #   };

    #   # Indent guides
    #   indent-blankline = {
    #     enable = true;
    #     settings = {
    #       indent = { char = "│"; };
    #       scope = { enabled = true; show_start = true; char = "│"; };
    #     };
    #   };

    #   # Comment
    #   comment = {
    #     enable = true;
    #     settings.padding = true;
    #     settings.sticky = true;
    #     settings.ignore = "^$";
    #     settings.toggler.line = "gcc";
    #     settings.opleader.line = "gc";
    #     settings.extra.above = "gcO";
    #     settings.extra.below = "gco";
    #     settings.extra.eol = "gcA";
    #     settings.motions.enable = true;
    #   };

    #   # Surround
    #   nvim-surround = {
    #     enable = true;
    #     settings = {
    #       keymaps = {
    #         normal = "ys";
    #         normal_cur = "yss";
    #         normal_line = "yS";
    #         visual = "S";
    #         delete = "ds";
    #         change = "cs";
    #       };
    #     };
    #   };

    #   # Auto pairs
    #   nvim-autopairs = {
    #     enable = true;
    #     settings = {
    #       check_ts = true;
    #       disable_filetype = [ "TelescopePrompt" "spectre_panel" ];
    #     };
    #   };

    #   # DAP (Debug Adapter Protocol)
    #   dap = {
    #     enable = true;
    #   };

    #   # DAP Python
    #   dap-python = {
    #     enable = true;
    #   };
      
    #   # DAP Go
    #   dap-go = {
    #     enable = true;
    #   };

    #   # DAP UI
    #   dap-ui = {
    #     enable = true;
    #   };

    #   # Data engineering specific plugins
    #   # CSV handling
    #   # csv-vim = {
    #   #   enable = true;
    #   #   filetype = "csv";
    #   #   delimiter_char = ",";
    #   #   column_highlight = "CursorColumn";
    #   #   strip_whitespace = 1;
    #   # };





    #   # # Color schemes
    #   # catppuccin = {
    #   #   enable = true;
    #   #   flavour = "mocha";
    #   #   background = {
    #   #     light = "latte";
    #   #     dark = "mocha";
    #   #   };
    #   #   transparent_background = false;
    #   #   term_colors = true;
    #   #   integrations = {
    #   #     aerial = true;
    #   #     alpha = true;
    #   #     barbar = true;
    #   #     beacon = true;
    #   #     cmp = true;
    #   #     coc_nvim = true;
    #   #     dap = true;
    #   #     dap_ui = true;
    #   #     fern = true;
    #   #     fidget = true;
    #   #     gitgutter = true;
    #   #     gitsigns = true;
    #   #     harpoon = true;
    #   #     illuminate = true;
    #   #     indent_blankline = true;
    #   #     leap = true;
    #   #     lightspeed = true;
    #   #     lsp_saga = true;
    #   #     lsp_trouble = true;
    #   #     mason = true;
    #   #     native_lsp = true;
    #   #     neogit = true;
    #   #     neotest = true;
    #   #     neotree = true;
    #   #     notify = true;
    #   #     nvimtree = true;
    #   #     overseer = true;
    #   #     pounce = true;
    #   #     symbols_outline = true;
    #   #     telekasten = true;
    #   #     telescope = true;
    #   #     treesitter = true;
    #   #     treesitter_context = true;
    #   #     ts_rainbow = true;
    #   #     vim_sneak = true;
    #   #     vimwiki = true;
    #   #     which_key = true;
    #   #   };
    #   # };
    # };

    # # Extra packages
    # extraPackages = with pkgs; [
    #   # LSP servers
    #   pyright
    #   rust-analyzer
    #   gopls
    #   typescript
    #   nodePackages.typescript-language-server
    #   yaml-language-server
    #   json-language-server
    #   marksman
    #   docker-language-server
    #   terraform-ls
    #   nil
      
    #   # Debuggers
    #   python39Packages.debugpy
    #   delve
      
    #   # Data engineering tools
    #   jupyter
    #   sqlite
    #   postgresql
    #   mysql80
      
    #   # Development tools
    #   git
    #   ripgrep
    #   fd
    #   fzf
    #   tree-sitter
    # ];
  };
}
