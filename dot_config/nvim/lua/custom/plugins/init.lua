return {

   {
      "windwp/nvim-ts-autotag",
      ft = { "html", "javascriptreact" },
      after = "nvim-treesitter",
      config = function()
         require("nvim-ts-autotag").setup()
      end,
   },

   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },

   {
      "nvim-telescope/telescope-media-files.nvim",
      after = "telescope.nvim",
      config = function()
         require("telescope").setup {
            extensions = {
               media_files = {
                  filetypes = { "png", "webp", "jpg", "jpeg" },
               },
               -- fd is needed
            },
         }
         require("telescope").load_extension "media_files"
      end,
   },

   { "williamboman/nvim-lsp-installer" },

   {
      "phaazon/hop.nvim",
      config = function()
         -- you can configure Hop the way you like here; see :h hop-config
         require("hop").setup()
         vim.api.nvim_set_keymap("n", "s", ":HopChar2<cr>", { silent = true })
         vim.api.nvim_set_keymap("n", "S", ":HopWord<cr>", { silent = true })
      end,
   },
}
