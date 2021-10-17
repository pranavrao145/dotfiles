-- get CWD
local cwd = vim.loop.cwd()

-- set vim env depending on
if string.find(cwd, "fulcrum-mk2", 0, true) then
    vim.env.DOCKER = true
end

if string.find(cwd, "atom-v2", 0, true) then
    vim.env.NODE = true
end