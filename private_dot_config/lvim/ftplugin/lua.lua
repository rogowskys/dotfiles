local opts = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      telemetry = {
        enable = false,
      },
      runtime = {
        version = 'LuaJIT',
        special = {
          reload = 'require',
        },
      },
      diagnostics = {
        globals = { 'vim', 'lvim', 'reload' },
      },
      completion = {
        callSnippet = 'Replace'
      },
      format = {
        enable = true,
        defaultConfig = {
          indent_style = 'space',
          indent_size = '2',
          quote_style = 'single'
        }
      },
      workspace = {
        library = {
          vim.fn.expand '$VIMRUNTIME',
          get_lvim_base_dir(),
          require('neodev.config').types(),
          plugins = true,
        },
        checkThirdParty = false,

        maxPreload = 5000,
        preloadFileSize = 10000,
      }
    },
  }
}
require('neodev').setup({})
require('lvim.lsp.manager').setup('lua_ls', opts)
