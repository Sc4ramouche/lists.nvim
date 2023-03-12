local popup = require("plenary.popup")

local M = {}

-- The following list is based on https://github.com/pvdlg/conventional-commit-types
-- TODO: dynamically provide the strings required
local title = "Conventional Commits"
local contents = {
    "    feat: a new feature",
    "     fix: a bug fix",
    "    docs: documentation only changes",
    "   style: ui-related changes, no logic",
    "refactor: neither a bug fix nor a feature",
    "    perf: performance improvements",
    "    test: adding new or fixing existing test",
    "   build: changes that affect the build system",
    "      ci: changes for CI configuration",
    "   chore: other changes that don't modify src or test files",
}

Lists_win_id = nil
Lists_bufh = nil

local function close_menu()
    vim.api.nvim_win_close(Lists_win_id, true)
    Lists_win_id = nil
    Lists_bufh = nil
end

local function create_window()
    local width = 60
    local height = 12
    local bufnr = vim.api.nvim_create_buf(false, false)
    local borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

    -- the setup is based on https://github.com/ThePrimeagen/harpoon
    local Lists_win_id, win = popup.create(bufnr, {
        title = title,
        line = math.floor(((vim.o.lines - height) / 2) - 1),
        col = math.floor((vim.o.columns - width) / 2),
        minwidth = width,
        minheight = height,
        borderchars = borderchars,
    })

    -- TODO: I need to understand what this option does
    vim.api.nvim_win_set_option(
        win.border.win_id,
        "winhl",
        "Normal:HarpoonBorder"
    )

    return {
        bufnr = bufnr,
        win_id = Lists_win_id
    }
end

function M.toggle_menu()
    if Lists_win_id ~= nil and vim.api.nvim_win_is_valid(Lists_win_id) then
        close_menu()
        return
    end

    local win_info = create_window()
    Lists_win_id = win_info.win_id
    Lists_bufh = win_info.bufnr

    vim.api.nvim_buf_set_lines(Lists_bufh, 0, #contents, false, contents)
    -- TODO: note down the difference between "nowrite" and "acwrite"
    vim.api.nvim_buf_set_option(Lists_bufh, "buftype", "acwrite")

    vim.api.nvim_buf_set_keymap(
        Lists_bufh,
        "n",
        "q",
        "<Cmd>lua require('lists').toggle_menu()<CR>",
        { silent = true }
    )
    vim.api.nvim_buf_set_keymap(
        Lists_bufh,
        "n",
        "<ESC>",
        "<Cmd>lua require('lists').toggle_menu()<CR>",
        { silent = true }
    )
end

return M
