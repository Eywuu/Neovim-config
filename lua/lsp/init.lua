require("lsp.common")

local servers = {
  "servers.clangd",
	"servers.rust_analyzer",
	"servers.svelte",
	"servers.typescript",
	"servers.lua_ls"
}

for _, srv in ipairs(servers) do
  require("lsp." .. srv)
end

