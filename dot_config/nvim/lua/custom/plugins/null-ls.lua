local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {
   -- webdev stuff
   b.formatting.prettierd,
   b.formatting.rustywind,
   -- b.diagnostics.eslint_d,
   -- b.code_actions.eslint_d,

   -- Lua
   b.formatting.stylua,
}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
      -- format on save
      on_attach = function(client)
         if client.resolved_capabilities.document_formatting then
            vim.cmd [[
              augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
              augroup END
            ]]
         end
      end,
      -- end
   }
end

return M
