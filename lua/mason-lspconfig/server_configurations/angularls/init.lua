local _ = require "mason-core.functional"
local path = require "mason-core.path"
local platform = require "mason-core.platform"

local function get_angular_core_version(root_dir)
    local project_root = vim.fs.dirname(vim.fs.find("node_modules", { path = root_dir, upward = true })[1])

    if not project_root then
        return ""
    end

    local package_json = project_root .. "/package.json"
    if not vim.loop.fs_stat(package_json) then
        return ""
    end

    local contents = io.open(package_json):read "*a"
    local json = vim.json.decode(contents)
    if not json.dependencies then
        return ""
    end

    local angular_core_version = json.dependencies["@angular/core"]
    angular_core_version = angular_core_version and angular_core_version:match "%d+%.%d+%.%d+"

    return angular_core_version
end

---@param install_dir string
return function(install_dir)
    local append_node_modules = _.map(function(dir)
        return path.concat { dir, "node_modules" }
    end)

    local function get_cmd(workspace_dir)
        local angular_core_version = get_angular_core_version(workspace_dir)
        local cmd = {
            "ngserver",
            "--stdio",
            "--tsProbeLocations",
            table.concat(append_node_modules { install_dir, workspace_dir }, ","),
            "--ngProbeLocations",
            table.concat(
                append_node_modules {
                    path.concat { install_dir, "node_modules", "@angular", "language-server" },
                    workspace_dir,
                },
                ","
            ),
            '--angularCoreVersion',
            angular_core_version,
        }
        if platform.is.win then
            cmd[1] = vim.fn.exepath(cmd[1])
        end

        return cmd
    end

    return {
        cmd = get_cmd(vim.loop.cwd()),
        on_new_config = function(new_config, root_dir)
            new_config.cmd = get_cmd(root_dir)
        end,
    }
end
