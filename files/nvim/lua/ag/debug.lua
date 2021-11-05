local dap = require("dap")
local dapui = require("dapui")

local get_python_path = function()
    local venv_path = os.getenv("VIRTUAL_ENV")
    if venv_path then
        return venv_path .. "/bin/python"
    end
    return os.getenv("HOME") .. "/.virtualenvs/debugpy/bin/python"
end

local arg_parser = function(prompt)
    return function()
        local args = vim.fn.input(prompt)
        return vim.split(args, " ")
    end
end

local start_with_ui = function()
    dap.continue()
    dapui.open()
end

-- Configure UI
dapui.setup(
    {
        tray = {
            elements = {}
        }
    }
)

-- Configure debuggers
dap.adapters.python = {
    type = "executable",
    command = get_python_path(),
    args = {"-m", "debugpy.adapter"}
}

-- Python launch configurations
dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Django command",
        program = "manage.py",
        args = arg_parser("python manage.py "),
        console = "integratedTerminal"
    },
    {
        type = "python",
        request = "launch",
        name = "Run file",
        program = "${workspaceFolder}/${file}",
        args = arg_parser("Run with arguments: "),
        console = "integratedTerminal"
    }
}

-- Look and feel
vim.fn.sign_define("DapBreakpoint", {text = "🔴", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointCondition", {text = "🟡", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapBreakpointRejected", {text = "⭕️", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapStopped", {text = "👉", texthl = "", linehl = "", numhl = ""})
vim.fn.sign_define("DapLogPoint", {text = "📄", texthl = "", linehl = "", numhl = ""})

return {
    start_with_ui = start_with_ui
}