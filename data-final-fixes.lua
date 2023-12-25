if mods["bzaluminum"] then
    data.raw.technology["dmr18-repl-aluminum-2219-dmr"] = table.deepcopy(data.raw.technology["dmr18-repl-aluminum-2219"])
    data.raw.technology["dmr18-repl-aluminum-2219-dmr"].name = "dmr18-repl-aluminum-2219-dmr"
    data.raw.technology["dmr18-repl-aluminum-2219"] = nil
    data.raw.technology["dmr18-repl-aluminum-6061-dmr"] = table.deepcopy(data.raw.technology["dmr18-repl-aluminum-6061"])
    data.raw.technology["dmr18-repl-aluminum-6061-dmr"].name = "dmr18-repl-aluminum-6061-dmr"
    data.raw.technology["dmr18-repl-aluminum-6061"] = nil
    for tech, ttbl in pairs(data.raw.technology) do
        if ttbl.prerequisites then
            for i, prereq in pairs(ttbl.prerequisites) do
                if prereq == "dmr18-repl-aluminum-2219" or prereq == "dmr18-repl-aluminum-6061" then
                    ttbl.prerequisites[i] = prereq .. "-dmr"
                end
            end
        end
    end
end
