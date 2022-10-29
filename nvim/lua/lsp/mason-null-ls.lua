local mason_null_ls_status_ok, mason_null_ls = pcall(require, "mason-null-ls")
if not null_ls_status_ok then
	return
end

mason_null_ls.setup({
	ensure_installed = {'prettier', 'eslint_d'}
})
