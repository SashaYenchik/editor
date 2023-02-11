local dap = require "dap"
local utils = require "utils"

local find_lldb_path = function()
	-- currently lock on the version 1.8.1
	-- @todo: find a way to get vscode extension path
	if utils.get_binary_path "lldb-vscode" then
		return utils.get_binary_path "lldb-vscode"
	else
		return "/usr/bin/lldb-vscode"
	end
end

dap.adapters.lldb = {
	type = "executable",
	command = find_lldb_path(),
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = function()
			local input = vim.fn.input "Input args: "
			return vim.fn.split(input, " ", true)
		end,

		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = false,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
