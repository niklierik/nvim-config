return {
  {
    "mason-org/mason.nvim",
    version = "1.11.0",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "prettierd",
        "eslint_d",
        "deno",
        "angular-language-server",
      },
    },
  },
  { "mason-org/mason-lspconfig.nvim", version = "1.32.0" },
  { "joeveiga/ng.nvim" },
}
