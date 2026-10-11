vim.filetype.add({
	filename = {
		["compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["docker-compose.yml"] = "yaml.docker-compose",
	},
	pattern = {
		["templates/.*%.html"] = "htmldjango",
		["compose[%.%-].*%.ya?ml"] = "yaml.docker-compose",
		["docker%-compose[%.%-].*%.ya?ml"] = "yaml.docker-compose",
	},
})
