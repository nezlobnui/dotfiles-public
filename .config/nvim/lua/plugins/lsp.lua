return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Указываем список серверов для установки
      local servers = { "html", "tailwindcss", "templ" }

      opts.servers = opts.servers or {}
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
      end

      -- HTML: включаем форматирование и переопределяем filetypes (если нужно)
      opts.setup.html = function(_)
        require("lspconfig").html.setup({
          filetypes = { "html", "templ" }, -- поддержка templ как html
          init_options = {
            provideFormatter = true,
          },
        })
        return true
      end

      -- TailwindCSS: добавляем поддержку templ
      opts.setup.tailwindcss = function(_)
        require("lspconfig").tailwindcss.setup({
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "templ",
          },
          init_options = {
            userLanguages = {
              templ = "html",
            },
          },
        })
        return true
      end

      -- Templ: явно указываем команду, filetypes и root_dir
      opts.setup.templ = function(_)
        require("lspconfig").templ.setup({
          cmd = { "templ", "lsp" },
          filetypes = { "templ", "tmpl" },
          root_dir = require("lspconfig.util").root_pattern("go.mod", ".git"),
        })
        return true
      end
    end,
  },
}
