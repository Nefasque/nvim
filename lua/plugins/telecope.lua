return {
  "nvim-telescope/telescope.nvim",
   dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "ignore_case",      -- or "ignore_case" or "respect_case"
      },
    },
  },
  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,
  cmd = "Telescope",
  keys = {
    {
      "<leader>t",
      function ()
        require("telescope.builtin").builtin()
      end
    },
    {
      "<leader>tgf",
      function()
        require('telescope.builtin').git_files({ show_untracked = true })
      end,
      desc = "Telescope Git Files",
    },
    {
      "<leader>tb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Telescope buffers",
    },
    {
      "<leader>tgs",
      function()
        require("telescope.builtin").git_status()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>tgc",
      function()
        require("telescope.builtin").git_bcommits()
      end,
      desc = "Telescope Git status",
    },
    {
      "<leader>tgb",
      function()
        require("telescope.builtin").git_branches()
      end,
      desc = "Telescope Git branches",
    },
    {
      "<leader>trp",
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Plugins",
          cwd = "~/.config/nvim/lua/plugins",
          attach_mappings = function(_, map)
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            map("i", "<c-y>", function(prompt_bufnr)
              local new_plugin = action_state.get_current_line()
              actions.close(prompt_bufnr)
              vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
            end)
            return true
          end
        })
      end
    },
    {
      "<leader>tf",
      function()
        require('telescope.builtin').find_files()
      end,
      desc = "Telescope Find Files",
    },
    {
      "<leader>th",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope Help"
    },
    {
      "<leader>te",
      function()
        require("telescope").extensions.file_browser.file_browser({
         -- prompt_title = "loo",
         -- path = "%:h:p",
         -- select_buffer = true,
        })
      end,
      desc = "Telescope file browser"
    },
    {
      "<leader>tth",
      function()
        require("telescope.builtin").colorscheme({ enable_preview = true })
      end,
      desc = "explore theme colorschemes"
    },
    {
      "<leader>tm",
      function()
        require("telescope.builtin").marks()
      end,
      desc = "explore marks"
    },
    {
      "<leader>ts",
      function()
        require("telescope.builtin").spell_suggest()
      end,
      desc = "spell suggest"
    }
  },
}
