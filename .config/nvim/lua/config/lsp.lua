--enable function --
local function Enable(language_server) 

        vim.lsp.enable(language_server)
end

-- ======== Language servers ========= --

--to load new language servers dowload the server with Mason and enable it here
--with the same name provided by the nevim-lspconfig repository
Enable("clangd");
Enable("cmake");
Enable("cssls");
Enable("java_language_server");
Enable("lua_ls");
Enable("pyright");

