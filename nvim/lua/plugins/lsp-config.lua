return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "clangd",
          "pyright",
          "terraformls"
        },
      })
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "folke/neoconf.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- IMPORTANT: make sure to setup neodev BEFORE lspconfig
      require("neodev").setup({
        -- add any options here, or leave empty to use the default settings
      })
      require("neoconf").setup({
        -- override any of the default settings here
      })
      -- 새로운 방식: vim.lsp.config 사용
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      }
      vim.lsp.config.ts_ls = {} -- tsserver에서 ts_ls로 변경
      vim.lsp.config.clangd = {}
      vim.lsp.config.pyright = {}
      vim.lsp.config.terraformls = {}

      -- LSP 활성화
      vim.lsp.enable({ "lua_ls", "ts_ls", "clangd", "pyright", "terraformls" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
