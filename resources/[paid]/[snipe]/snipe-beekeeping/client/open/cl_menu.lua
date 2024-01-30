function OpenOptions(data, index)
    lib.registerContext({
        id = "beehive_menu",
        title = Config.Locale["menu_title"],
        options = {
            {
                title = Config.Locale["menu_progress"],
                description = data.progress.."%",
                disabled = true
            },
            {
                title = Config.Locale["menu_queen_bee"],
                description = data.queenbee and Config.Locale["menu_queen_bee_added"] or Config.Locale["menu_add_queen_bee"],
                disabled = data.queenbee or data.harvested,
                onSelect = function()
                    AddQueenBee(index, data.coords)
                end
            },
            {
                title = Config.Locale["menu_harvest"],
                description = not data.harvested and Config.Locale["menu_harvest_honey"] or Config.Locale["menu_honey_harvested"],
                disabled = data.harvested or not data.queenbee or data.progress < 100,
                onSelect = function()
                    HarvestHoney(index, data.coords)
                end
            },
            {
                title = Config.Locale["menu_destroy"],
                description = "Destroy Beehive",
                onSelect  = function()
                    destroyBeehive(data.obj)
                end
            },
        }
    })
    lib.showContext('beehive_menu')
end