require("lsp.common")

local servers = {
  "servers.clangd",
	"servers.rust_analyzer"
}

for _, srv in ipairs(servers) do
  require("lsp." .. srv)
end

