{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [ pyright pylint black ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " "; # <Space> is leader key

    # UI + editing options
    opts = {
      number = true; # show absolute line numbers
      relativenumber = true; # show relative line numbers
      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      wrap = false;
      cursorline = true;
      scrolloff = 8;
      termguicolors = true;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = { flavour = "mocha"; };
    };
    extraPlugins = with pkgs; [
      vimPlugins.noice-nvim
      vimPlugins.nui-nvim
      vimPlugins.dressing-nvim
      vimPlugins.nvim-notify
      vimPlugins.iron-nvim
      (vimUtils.buildVimPlugin {
        pname = "venv-selector-nvim";
        version = "unstable";
        src = pkgs.fetchFromGitHub {
          owner = "linux-cultist";
          repo = "venv-selector.nvim";
          rev = "main"; # or lock to a commit hash
          sha256 = "sha256-6bCageV2Wqm8j+pNZnyDcSzf5SH9frjOLweixvaz3dI=";
        };
      })

    ];

    plugins = {
      web-devicons.enable = true;

      treesitter = {
        enable = true;
        grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
          bash
          json
          lua
          make
          markdown
          nix
          regex
          toml
          vim
          vimdoc
          xml
          yaml
        ];
      };

      # telescope
      telescope = { enable = true; };

      # bufferline
      bufferline = {
        enable = true;
        settings = {
          options = {
            diagnostics = "nvim_lsp";
            separator_style = "slant";
          };
        };
      };

      # Lualine
      lualine = {
        enable = true;
        settings = {
          options = {
            theme = "catppuccin";
            section_separators = {
              left = "";
              right = "";
            };
            component_separators = {
              left = "";
              right = "";
            };
          };
        };
      };

      # which-key
      which-key = {
        enable = true;
        settings = {
          plugins = {
            marks = true;
            registers = true;
          };
          win.border = "single";
        };
      };
      mini = { enable = true; };
      mini-icons.enable = true;

      # LSP support
      lsp = {
        enable = true;
        servers = {
          # Python LSP
          pyright = {
            enable = true;
            settings = {
              python.pythonPath =
                "venv"; # venv-selector will override this dynamically
            };
          };
        };
        keymaps.lspBuf = {
          gd = "definition"; # Go to definition
          gD = "declaration"; # Go to declaration
          gi = "implementation";
          gr = "references";
          K = "hover"; # Hover docs
          rn = "rename"; # Rename symbol
        };
      };
      none-ls = {
        enable = true;
        sources = {
          diagnostics.pylint.enable = true; # Python linter
          formatting.black.enable = true; # Python formatter
        };
      };

      # Completion engine
      cmp = {
        enable = true;
        settings = {
          sources =
            [ { name = "nvim_lsp"; } { name = "buffer"; } { name = "path"; } ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping.select_next_item()";
            "<S-Tab>" = "cmp.mapping.select_prev_item()";
          };
        };
      };

      # Snippets (for completion)
      luasnip.enable = true;

      # nvim-tree
      nvim-tree = {
        enable = true;
        settings = {
          view = {
            width = 30;
            side = "left";
          };
          renderer = { group_empty = true; };
          filters = { dotfiles = false; };
        };
      };

      # Toggle term
      toggleterm = {
        enable = true;
        settings = {
          direction = "float";
          shade_terminals = true;
          start_in_insert = true;
        };
      };

      # Dashboard
      alpha = {
        enable = true;
        theme = "dashboard"; # other options: "startify", "theta"
      };

      gitsigns.enable = true; # git hunk signs & inline blame
      trouble.enable = true; # diagnostics/quickfix UI
      # symbols-outline.enable = true; # sidebar symbol tree
      nvim-autopairs.enable = true; # auto-close brackets/quotes
      hop.enable = true; # fast cursor jumps
      dap.enable = true; # debugging core
      dap-ui.enable = true; # debugging UI

    };

    extraConfigLua = ''
            require("venv-selector").setup({
              auto_refresh = true,
              name = ".venv",
            })


            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            dashboard.section.header.val = {
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤⣤⣤⡀   ",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⡿⠋⠁⠀⠘⢿⣆ ",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⡟⠁⠀⠀⠀⠀⠀⠀⠙⣧",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⡀⠀⠀⠀⣿⠁⠀⠀⣠⣶⣶⣦⡀⠀⠀⣿",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡏⠀⠀⠉⠙⢿⣦⠀⣿⠀⠀⠀⣿⣿⣿⣿⠀⠀⠀⣿",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣇⠀⠀⠀⠀⣸⡿⠀⢿⡀⠀⠀⠈⠛⠛⠉⠀⠀⢀⡿",
              "   ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣷⣄⣀⣠⡿⠁⠀⠀⠙⠶⣤⣄⣀⣀⣠⣴⡶⠋",
            }

            dashboard.section.buttons.val = {
              dashboard.button("e", "  New File", ":ene <CR>"),
              dashboard.button("f", "  Find File", ":Telescope find_files<CR>"),
              dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
              dashboard.button("t", "  Terminal", ":ToggleTerm<CR>"),
              dashboard.button("q", "  Quit", ":qa<CR>"),
            }

            dashboard.section.footer.val = { "⚡ Happy hacking ⚡" }

            alpha.setup(dashboard.config)

      -- noice.nvim setup
          require("noice").setup({
            lsp = { progress = { enabled = true } },
            presets = { bottom_search = true, command_palette = true }
          })

          -- dressing.nvim (better input/select UIs)
          require("dressing").setup()

          -- notify.nvim as default notification UI
          vim.notify = require("notify")

          -- iron.nvim (REPL integration)
          local iron = require("iron.core")
          iron.setup({
            config = {
              repl_definition = {
                python = { command = {"python"} },
              },
              repl_open_cmd = "vertical botright 60 split"
            },
            keymaps = {
              send_motion = "<leader>sc",
              visual_send = "<leader>sc",
              send_file = "<leader>sf",
              send_line = "<leader>sl",
              exit = "<leader>sq",
              clear = "<leader>cl",
            }
          })


    '';

    # Auto-format on save
    autoCmd = [{
      event = "BufWritePre";
      pattern = "*.py";
      command = "lua vim.lsp.buf.format()";
    }];

    # Keymaps
    keymaps = [
      # Telescope
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
      {
        mode = "n";
        key = "<leader>fh";
        action = "<cmd>Telescope help_tags<CR>";
        options.desc = "Find help";
      }
      {
        mode = "n";
        key = "<leader>?";
        action = "<cmd>Telescope keymaps<CR>";
        options.desc = "Search keymaps";
      }

      # Bufferline
      {
        mode = "n";
        key = "<S-l>";
        action = "<cmd>BufferLineCycleNext<CR>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key = "<S-h>";
        action = "<cmd>BufferLineCyclePrev<CR>";
        options.desc = "Previous buffer";
      }

      # Basics
      {
        mode = "n";
        key = "<leader>w";
        action = "<cmd>w<CR>";
        options.desc = "Save file";
      }
      {
        mode = "n";
        key = "<leader>q";
        action = "<cmd>q<CR>";
        options.desc = "Quit";
      }

      # nvim-tree
      {
        mode = "n";
        key = "<leader>e";
        action = "<cmd>NvimTreeToggle<CR>";
        options.desc = "Toggle file explorer";
      }
      {
        mode = "n";
        key = "<leader>f";
        action = "<cmd>NvimTreeFindFile<CR>";
        options.desc = "Focus current file in explorer";
      }

      # PYTHON STUFF
      {
        mode = "n";
        key = "<leader>lf";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options.desc = "Format buffer";
      }
      {
        mode = "n";
        key = "<leader>la";
        action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
        options.desc = "Code action";
      }
      {
        mode = "n";
        key = "<leader>ld";
        action = "<cmd>lua vim.diagnostic.open_float()<CR>";
        options.desc = "Show diagnostics";
      }
      {
        mode = "n";
        key = "[d";
        action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
        options.desc = "Prev diagnostic";
      }
      {
        mode = "n";
        key = "]d";
        action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
        options.desc = "Next diagnostic";
      }

      # Venv selector
      {
        mode = "n";
        key = "<leader>vs";
        action = "<cmd>VenvSelect<CR>";
        options.desc = "Select Python venv";
      }
      # # Hover / Signature help
      # { mode = "n"; key = "K"; action = "<cmd>lua vim.lsp.buf.hover()<CR>"; options.desc = "LSP Hover"; }
      # { mode = "n"; key = "<leader>sh"; action = "<cmd>lua vim.lsp.buf.signature_help()<CR>"; options.desc = "LSP Signature Help"; }

      # # Go to definition / references
      # { mode = "n"; key = "gd"; action = "<cmd>lua vim.lsp.buf.definition()<CR>"; options.desc = "LSP Go to Definition"; }
      # { mode = "n"; key = "gr"; action = "<cmd>lua vim.lsp.buf.references()<CR>"; options.desc = "LSP References"; }

      # # Workspace symbols (could use Telescope)
      # { mode = "n"; key = "<leader>ws"; action = "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"; options.desc = "Workspace Symbols"; }

      # # Code actions
      # { mode = "n"; key = "<leader>ca"; action = "<cmd>lua vim.lsp.buf.code_action()<CR>"; options.desc = "LSP Code Action"; }

      # Toggle term
      {
        mode = "n"; # normal mode
        key = "<A-i>"; # Alt+i
        action = "<cmd>ToggleTerm<CR>";
        options.desc = "Toggle floating terminal";
      }
      {
        mode = "t"; # terminal mode
        key = "<Esc>"; # exit to normal mode
        action = "<C-\\><C-n>";
        options.desc = "Exit terminal mode";
      }

      # trouble
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>TroubleToggle<CR>";
        options.desc = "Toggle Trouble";
      }

      # symbols outline
      # {
      #   mode = "n";
      #   key = "<leader>so";
      #   action = "<cmd>SymbolsOutline<CR>";
      #   options.desc = "Symbols Outline";
      # }

      # gitsigns
      {
        mode = "n";
        key = "]c";
        action = "<cmd>Gitsigns next_hunk<CR>";
        options.desc = "Next Git hunk";
      }
      {
        mode = "n";
        key = "[c";
        action = "<cmd>Gitsigns prev_hunk<CR>";
        options.desc = "Prev Git hunk";
      }
      {
        mode = "n";
        key = "<leader>gp";
        action = "<cmd>Gitsigns preview_hunk<CR>";
        options.desc = "Preview hunk";
      }
      {
        mode = "n";
        key = "<leader>gb";
        action = "<cmd>Gitsigns blame_line<CR>";
        options.desc = "Git blame";
      }

      # dap
      {
        mode = "n";
        key = "<F5>";
        action = "<cmd>lua require'dap'.continue()<CR>";
        options.desc = "DAP Continue";
      }
      {
        mode = "n";
        key = "<F10>";
        action = "<cmd>lua require'dap'.step_over()<CR>";
        options.desc = "DAP Step Over";
      }
      {
        mode = "n";
        key = "<F11>";
        action = "<cmd>lua require'dap'.step_into()<CR>";
        options.desc = "DAP Step Into";
      }
      {
        mode = "n";
        key = "<F12>";
        action = "<cmd>lua require'dap'.step_out()<CR>";
        options.desc = "DAP Step Out";
      }
      {
        mode = "n";
        key = "<leader>b";
        action = "<cmd>lua require'dap'.toggle_breakpoint()<CR>";
        options.desc = "DAP Breakpoint";
      }
      {
        mode = "n";
        key = "<leader>dr";
        action = "<cmd>lua require'dap'.repl.open()<CR>";
        options.desc = "DAP REPL";
      }

      # iron.nvim (REPL)
      {
        mode = "n";
        key = "<leader>sl";
        action = "<cmd>IronRepl<CR>";
        options.desc = "Open REPL";
      }
      {
        mode = "n";
        key = "<leader>sc";
        action = "<cmd>IronSend<CR>";
        options.desc = "Send to REPL";
      }

    ];
  };
}
