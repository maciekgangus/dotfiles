return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- 1. Brutalnie odcinamy standardowego pyrighta, żeby nie było konfliktów
        pyright = {
          enabled = false,
        },
        -- 2. Konfigurujemy basedpyright
        basedpyright = {
          settings = {
            basedpyright = {
              analysis = {
                -- Możesz tu ustawić "basic", "standard" lub "strict"
                -- w zależności od tego, jak bardzo chcesz, żeby krzyczał o typy
                typeCheckingMode = "standard",
                autoImportCompletions = true,
                autoSearchPaths = true,
              },
            },
          },
        },
      },
    },
  },
}
