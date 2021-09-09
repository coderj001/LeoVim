local function bind_option(options)
	for k, v in pairs(options) do
		if v == true or v == false then
			vim.cmd("set " .. k)
		else
			vim.cmd("set " .. k .. "=" .. v)
		end
	end
end

local function bind_extra_cmd(options)
	for optionCount = 1, #options do
		vim.cmd(options[optionCount])
	end
end

function load_extra_options()
	local options = {
		"filetype plugin on",
		"filetype indent on",
		"cabbr Q q",
		"cabbr Q! q!",
		"cabbr W! w!",
		"cabbr W w",
		"cabbr WA wa",
		"cabbr Wa wa",
		"cabbr Wq wq",
		"cabbr WQ wq",
		"cabbr Qa qa",
		"cabbr QA qa",
	}
	bind_extra_cmd(options)
end

load_extra_options()
