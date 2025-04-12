return {
	"xeluxee/competitest.nvim",
	dependencies = "MunifTanjim/nui.nvim",
	config = function()
		require("competitest").setup({
			compile_command = {
				c = { exec = "clang", args = { "-Wall", "$(FNAME)", "-O2", "-o", "$(FNOEXT).out" } },
				cpp = { exec = "clang++", args = { "-Wall", "-std=c++17", "-O2", "$(FNAME)", "-o", "$(FNOEXT).out" } },
			},
			run_command = {
				c = { exec = "./$(FNOEXT).out" },
				cpp = { exec = "./$(FNOEXT).out" },
				rust = { exec = "./$(FNOEXT)" },
				python = { exec = "python3", args = { "$(FNAME)" } },
				java = { exec = "java", args = { "$(FNOEXT)" } },
			},
		}) -- to use default configuration, but modified some compile and run command
		vim.keymap.set("n", "<leader>ctr", ":CompetiTest run<CR>", {})
		vim.keymap.set("n", "<leader>cta", ":CompetiTest add_testcase<CR>", {})
		vim.keymap.set("n", "<leader>cte", ":CompetiTest edit_testcase<CR>", {})
		vim.keymap.set("n", "<leader>ctd", ":CompetiTest delete_testcase<CR>", {})
	end,
}
