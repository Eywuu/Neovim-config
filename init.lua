require('config.lazy')
require("config.options")

vim.api.nvim_create_user_command("Fmt", function()
	if vim.bo.filetype ~= "rust" then
		vim.notify("CargoFmt is only valid for Rust buffers", vim.log.levels.WARN)
		return
	end

	vim.cmd("write")

	vim.fn.jobstart({ "cargo", "fmt" }, {
		on_exit = function(_, code)
			if code == 0 then
				vim.schedule(function()
					vim.cmd("edit!")
					vim.notify("cargo fmt completed", vim.log.levels.INFO)
				end)
			else
				vim.schedule(function()
					vim.notif("cargo fmt failed", vim.log.levels.ERROR)
				end)
			end
		end,
	})
end, {})
