{ config, pkgs, lib, ... }:

{
  programs.nixvim = {
    enable = true;
    
    # Global options
    globals = {
      mapleader = " ";
      maplocalleader = ",";
      # Better search
      incsearch = true;
      hlsearch = true;
      ignorecase = true;
      smartcase = true;
      # Better editing
      expandtab = true;
      shiftwidth = 2;
      tabstop = 2;
      softtabstop = 2;
      autoindent = true;
      smartindent = true;
      # Better UI
      number = true;
      relativenumber = true;
      cursorline = true;
      signcolumn = "yes";
      colorcolumn = "80";
      # Better splits
      splitbelow = true;
      splitright = true;
      # Better file handling
      hidden = true;
      autoread = true;
      # Better completion
      completeopt = "menuone,noselect";
      # Better terminal
      termguicolors = true;
    };

    # Keymaps
    keymaps = [
      # General navigation
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options.desc = "Navigate to left split";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options.desc = "Navigate to bottom split";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options.desc = "Navigate to top split";
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options.desc = "Navigate to right split";
      }
      # File management
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Toggle file explorer";
      }
      {
        mode = "n";
        key = "<leader>ff";
        action = "<cmd>Telescope find_files<CR>";
        options.desc = "Find files";
      }
      {
        mode = "n";
        key = "<leader>fg";
        action = "<cmd>Telescope live_grep<CR>";
        options.desc = "Live grep";
      }
      {
        mode = "n";
        key = "<leader>fb";
        action = "<cmd>Telescope buffers<CR>";
        options.desc = "Find buffers";
      }
      # LSP keymaps
      {
        mode = "n";
        key = "gd";
        action = "<cmd>lua vim.lsp.buf.definition()<CR>";
        options.desc = "Go to definition";
      }
      {
        mode = "n";
        key = "gr";
        action = "<cmd>lua vim.lsp.buf.references()<CR>";
        options.desc = "Go to references";
      }
      {
        mode = "n";
        key = "K";
        action = "<cmd>lua vim.lsp.buf.hover()<CR>";
        options.desc = "Show hover";
      }
      {
        mode = "n";
        key = "<leader>ca";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Code actions";
      }
      {
        mode = "n";
        key = "<leader>rn";
        action = "<cmd>lua vim.lsp.buf.rename()<CR>";
        options.desc = "Rename symbol";
      }
      # DAP keymaps
      {
        mode = "n";
        key = "<leader>db";
        action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
        options.desc = "Toggle breakpoint";
      }
      {
        mode = "n";
        key = "<leader>dc";
        action = "<cmd>lua require('dap').continue()<CR>";
        options.desc = "Continue/Start debugging";
      }
      {
        mode = "n";
        key = "<leader>di";
        action = "<cmd>lua require('dap').step_into()<CR>";
        options.desc = "Step into";
      }
      {
        mode = "n";
        key = "<leader>do";
        action = "<cmd>lua require('dap').step_over()<CR>";
        options.desc = "Step over";
      }
      {
        mode = "n";
        key = "<leader>du";
        action = "<cmd>lua require('dap').step_out()<CR>";
        options.desc = "Step out";
      }
      # Git integration
      {
        mode = "n";
        key = "<leader>gs";
        action = "<cmd>Git<CR>";
        options.desc = "Git status";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Git blame<CR>";
        options.desc = "Git blame";
      }
    ];

    # Plugins
    plugins = {
      # Essential plugins
      nvim-tree = {
        enable = true;
        git.enable = true;
        renderer.icons.show.git = true;
      };
      
      telescope = {
        enable = true;
        extensions = {
          fzf-native.enable = true;
          file-browser.enable = true;
          project-nvim.enable = true;
        };
      };

      # LSP and completion
      lsp = {
        enable = true;
        servers = {
          # Python
          pyright = {
            enable = true;
            settings = {
              python.analysis = {
                typeCheckingMode = "basic";
                autoSearchPaths = true;
                useLibraryCodeForTypes = true;
              };
            };
          };
          # Rust
          rust-analyzer = {
            enable = true;
            settings = {
              rust-analyzer.checkOnSave.command = "clippy";
            };
          };
          # Go
          gopls = {
            enable = true;
            settings = {
              gopls.usePlaceholders = true;
              gopls.completeUnimported = true;
            };
          };
          # JavaScript/TypeScript
          tsserver = {
            enable = true;
            settings = {
              typescript.preferences.includePackageJsonAutoImports = "on";
            };
          };
          # SQL
          sqlls.enable = true;
          # YAML
          yamlls.enable = true;
          # JSON
          jsonls.enable = true;
          # Markdown
          marksman.enable = true;
          # Docker
          dockerls.enable = true;
          # Terraform
          terraformls.enable = true;
          # Nix
          nil_ls.enable = true;
        };
      };

      # Completion
      cmp = {
        enable = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "nvim_lua"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
          { name = "git"; }
        ];
      };

      luasnip = {
        enable = true;
        fromVscode = [ 1 ];
      };

      # Treesitter for syntax highlighting
      treesitter = {
        enable = true;
        indent = true;
        highlight = {
          enable = true;
          additionalVimRegexHighlighting = false;
        };
        ensureInstalled = [
          "python"
          "rust"
          "go"
          "javascript"
          "typescript"
          "tsx"
          "json"
          "yaml"
          "toml"
          "sql"
          "markdown"
          "dockerfile"
          "terraform"
          "nix"
          "bash"
          "lua"
          "vim"
        ];
      };

      # Git integration
      gitsigns = {
        enable = true;
        signs = {
          add.text = "+";
          change.text = "~";
          delete.text = "_";
          topdelete.text = "‾";
          changedelete.text = "~";
        };
      };

      # Status line
      lualine = {
        enable = true;
        theme = "auto";
        sections = {
          lualine_a = [ "mode" ];
          lualine_b = [ "branch" "diff" "diagnostics" ];
          lualine_c = [ "filename" ];
          lualine_x = [ "encoding" "filetype" ];
          lualine_y = [ "progress" ];
          lualine_z = [ "location" ];
        };
      };

      # Buffer line
      bufferline = {
        enable = true;
        options = {
          diagnostics = "nvim_lsp";
          always_show_bufferline = false;
          show_buffer_close_icons = true;
          show_close_icon = false;
          color_icons = true;
        };
      };

      # Indent guides
      indent-blankline = {
        enable = true;
        char = "│";
        context_char = "│";
        show_current_context = true;
        show_current_context_start = true;
      };

      # Comment
      comment = {
        enable = true;
        padding = true;
        sticky = true;
        ignore = "^$";
        toggler.line = "gcc";
        opleader.line = "gc";
        extra.above = "gcO";
        extra.below = "gco";
        extra.eol = "gcA";
        motions.enable = true;
      };

      # Surround
      surround = {
        enable = true;
        keymaps = {
          normal = "ys";
          normal_cur_line = "yss";
          normal_line = "yS";
          visual = "S";
          delete = "ds";
          change = "cs";
        };
      };

      # Auto pairs
      autopairs = {
        enable = true;
        check_ts = true;
        disable_filetype = [ "TelescopePrompt" "spectre_panel" ];
      };

      # DAP (Debug Adapter Protocol)
      dap = {
        enable = true;
        extensions = {
          dap-python = {
            enable = true;
            adapter = {
              type = "executable";
              command = "python";
              args = [ "-m" "debugpy.adapter" ];
            };
            configuration = {
              type = "python";
              request = "launch";
              program = "\${file}";
              console = "integratedTerminal";
              justMyCode = true;
            };
          };
          dap-go = {
            enable = true;
            adapter = {
              type = "executable";
              command = "dlv";
              args = [ "dap" "-l" "127.0.0.1:38697" ];
            };
            configuration = {
              type = "go";
              name = "Debug";
              request = "launch";
              program = "\${fileDirname}";
            };
          };
        };
      };

      # DAP UI
      dapui = {
        enable = true;
        layouts = [
          {
            elements = [
              { id = "scopes"; size = 0.33; }
              { id = "breakpoints"; size = 0.17; }
              { id = "stacks"; size = 0.25; }
              { id = "watches"; size = 0.25; }
            ];
            size = 0.33;
            position = "right";
          }
          {
            elements = [
              { id = "repl"; size = 0.45; }
              { id = "console"; size = 0.55; }
            ];
            size = 0.27;
            position = "bottom";
          }
        ];
      };

      # Data engineering specific plugins
      # CSV handling
      csv-vim = {
        enable = true;
        filetype = "csv";
        delimiter_char = ",";
        column_highlight = "CursorColumn";
        strip_whitespace = 1;
      };

      # SQL formatting
      sqlformat = {
        enable = true;
        options = {
          reindent = true;
          keywords = "upper";
          use_space_around_operators = true;
          indent_width = 2;
        };
      };

      # Jupyter notebook support
      jupyter-nvim = {
        enable = true;
        cmd = "jupyter";
        kernel_timeout = 20;
        debug = false;
        auto_start_server = true;
        auto_start_session = true;
        auto_start_kernel = true;
        auto_start_console = true;
        auto_start_repl = true;
        auto_start_terminal = true;
        auto_start_file_browser = true;
        auto_start_outline = true;
        auto_start_help = true;
        auto_start_man = true;
        auto_start_tags = true;
        auto_start_quickfix = true;
        auto_start_location = true;
        auto_start_jumplist = true;
        auto_start_changelist = true;
        auto_start_marks = true;
        auto_start_registers = true;
        auto_start_macros = true;
        auto_start_undo = true;
        auto_start_backup = true;
        auto_start_swap = true;
        auto_start_temp = true;
        auto_start_netrw = true;
      };

      # Database client
      dbui = {
        enable = true;
        save_location = "~/.local/share/db_ui";
        show_help = true;
        show_quick_help = true;
        position = "left";
        width = 40;
        winbar = true;
        mappings = {
          help = "?";
          jump_to_db = "<CR>";
          jump_to_line = "o";
          describe = "d";
          toggle_details = "S";
          edit_query = "e";
          select = "<Tab>";
          expand = "zo";
          collapse = "zc";
          collapse_all = "zM";
          expand_all = "zR";
          refresh = "R";
          connections = "c";
          add_connection = "a";
        };
      };

      # Markdown preview
      markdown-preview = {
        enable = true;
        browser = "firefox";
        port = "8080";
        host = "127.0.0.1";
        page_title = "Markdown Preview";
        auto_close = false;
        auto_start = false;
        auto_refresh = true;
        auto_save = true;
        auto_open = false;
      };

      # Color schemes
      catppuccin = {
        enable = true;
        flavour = "mocha";
        background = {
          light = "latte";
          dark = "mocha";
        };
        transparent_background = false;
        term_colors = true;
        integrations = {
          aerial = true;
          alpha = true;
          barbar = true;
          beacon = true;
          cmp = true;
          coc_nvim = true;
          dap = true;
          dap_ui = true;
          fern = true;
          fidget = true;
          gitgutter = true;
          gitsigns = true;
          harpoon = true;
          illuminate = true;
          indent_blankline = true;
          leap = true;
          lightspeed = true;
          lsp_saga = true;
          lsp_trouble = true;
          mason = true;
          native_lsp = true;
          neogit = true;
          neotest = true;
          neotree = true;
          notify = true;
          nvimtree = true;
          overseer = true;
          pounce = true;
          symbols_outline = true;
          telekasten = true;
          telescope = true;
          treesitter = true;
          treesitter_context = true;
          ts_rainbow = true;
          vim_sneak = true;
          vimwiki = true;
          which_key = true;
        };
      };
    };

    # Extra packages
    extraPackages = with pkgs; [
      # LSP servers
      pyright
      rust-analyzer
      gopls
      typescript
      nodePackages.typescript-language-server
      sql-language-server
      yaml-language-server
      json-language-server
      marksman
      docker-language-server
      terraform-ls
      nil
      
      # Debuggers
      python39Packages.debugpy
      delve
      
      # Data engineering tools
      jupyter
      sqlite
      postgresql
      mysql80
      
      # Development tools
      git
      ripgrep
      fd
      fzf
      tree-sitter
    ];
  };
}

