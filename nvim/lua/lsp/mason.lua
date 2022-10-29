local status1, mason = pcall(require, "mason")
if not status1 then
  print("mason is not installed")
  return
end

local status2, mason_lsp = pcall(require, "mason-lspconfig")

if not status2 then
    print("mason-lspconfig is not installed")
    return
end

mason.setup()

mason_lsp.setup({
	ensure_installed = {
        "cssls", 
        "cssmodules_ls",
        "eslint",
        "emmet_ls",
        "html",
        "jsonls",
        "tsserver",
        "tailwindcss",
        "vimls",
        "yamlls",
        "marksman",
        "remark_ls", 
  },
})

