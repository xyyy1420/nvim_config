return {
  -- color scheme
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function ()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          emphasis = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = false,
      })
      vim.o.background = "dark"
      vim.cmd('colorscheme gruvbox')
    end,
  },
-- TreeSitter config copy from lazyvim {{{
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function ()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          load_textobjects = true
        end,
      }
    },
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
        use_languagetree=false,
        disable = function(_,bufnr)
          local buf_name = vim.api.nvim_buf_get_name(bufnr)
          local file_size=vim.api.nvim_call_function("getfsize",{buf_name})
          return file_size > 256*1024
        end,
      },
      indent = { enable = true },
      ensure_installed = {
        "bash",
        "c",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "vimdoc",
        "yaml",
        "scala"
      },
      incremental_selection = {
      enable = false,
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)

      if load_textobjects then
      -- PERF: no need to load the plugin, if we only need its queries for mini.ai
        if opts.textobjects then
          for _, mod in ipairs({ "move", "select", "swap", "lsp_interop" }) do
            if opts.textobjects[mod] and opts.textobjects[mod].enable then
              local Loader = require("lazy.core.loader")
              Loader.disabled_rtp_plugins["nvim-treesitter-textobjects"] = nil
              local plugin = require("lazy.core.config").plugins["nvim-treesitter-textobjects"]
              require("lazy.core.loader").source_runtime(plugin.dir, "plugin")
              break
            end
          end
        end
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip"
    },
    branch = 'v3.x',
    config = function()
      require("plugins.lsp-zero")
    end
  },
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local fzf_lua = require("fzf-lua")

      local function gtags_global(query)
        local handle = io.popen("global -x " .. query)
        local result = handle:read("*a")
        handle:close()

        local lines = {}
        for line in result:gmatch("[^\r\n]+") do
          table.insert(lines, line)
        end

        fzf_lua.fzf_exec(lines, {
          prompt = 'GTags> ',
          actions = {
            ['default'] = function (selected)
              local file, line = selected[1]:match("([^:]+):(%d+)")
              vim.cmd(string.format('edit +%s %s',line,file))
            end
          }
        })
      end
      vim.api.nvim_create_user_command('GtagsGlobal', function(opts)
        gtags_global(opts.args)
      end, { nargs = 1 })
      -- calling `setup` is optional for customization
      require("fzf-lua").setup({})
    end,
  },

  -- Neoformat
  {
    "sbdchd/neoformat",
  },

  -- Tmux
  -- set keybinding in tmux and nvim
  {
    "aserowy/tmux.nvim",
    configs = function()
      return require("tmux").setup()
    end,
  },

  {
    "stevearc/oil.nvim",
      opts = function()

    end,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat"
    },
    config = function ()
      require('leap').add_default_mappings()
    end
  },

  "folke/lazydev.nvim",
  "folke/which-key.nvim",
  {
    "folke/neoconf.nvim",
    cmd = "Neoconf"
  },
--  {
--    "lewis6991/gitsigns.nvim",
--    config = function ()
--      require('gitsigns').setup()
--    end
--  },
  -- enhance open file from terminal
  {
    "willothy/flatten.nvim",
    config = true,
    lazy = false,
    priority = 1001,
  },
  {
    "t-troebst/perfanno.nvim",
    config = function ()
      require("perfanno").setup({})
    end
  }
}
