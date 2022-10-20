local status1, m = pcall(require, "mason")
if not status1 then
  print("mason is not installed")
  return
end


local status2, m_lsp = pcall(require, "mason-lspconfig")

if not status2 then
    print("mason-lspconfig is not installed")
    return
end

-- local lspconfig = require("lspconfig")

local servers = { 
        "cssls", 
        "eslint",
        "emmet_ls",
        "html",
        "jsonls",
        "tsserver",
        "tailwindcss",
        "vimls",
        "yamlls",
}

m.setup()
m_lsp.setup({
	ensure_installed = servers,
    automatic_installation = false,
})


