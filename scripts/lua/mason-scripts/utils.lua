local _ = require "mason-core.functional"
local fs = require "mason-core.fs"

local M = {}

---@async
---@param path string
---@param contents string
---@param flags string?
function M.write_file(path, contents, flags)
    local header = _.cond({
        {
            _.matches "%.lua$",
            _.always {
                "-- THIS FILE IS GENERATED. DO NOT EDIT MANUALLY.",
                "-- stylua: ignore start",
            },
        },
        {
            _.matches "%.md$",
            _.always {
                "<!--- THIS FILE IS GENERATED. DO NOT EDIT MANUALLY. -->",
            },
        },
        {
            _.matches "doc/.+%.txt$",
            _.always {},
        },
        {
            _.T,
            _.always {
                "# THIS FILE IS GENERATED. DO NOT EDIT MANUALLY.",
            },
        },
    }, path)

    fs.async.write_file(path, table.concat(_.concat(header, { contents }), "\n"), flags)
end

return M
