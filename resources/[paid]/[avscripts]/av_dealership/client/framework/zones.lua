local allZones = {}
local hideUI = false

function registerZone(data)
    local identifier = data['identifier']
    local dealership = data['extraData']
    local distance = data['distance']
    local coords = data['coords']
    local options = data['options']
    if options and options[1] then
        local event = options[1]['event']
        local job = options[1]['job']
        local label = options[1]['label']
        allZones[identifier] = lib.points.new({
            coords = coords,
            distance = 2,
            dealership = dealership,
            event = event,
            job = job,
            label = label
        })
        refreshZones()
    end
end

function removeZone(name)
    if allZones[name] then
        allZones[name]:remove()
        allZones[name] = nil
        refreshZones()
    end
end

function refreshZones()
    for k, v in pairs(allZones) do
        function v:nearby()
            if self.currentDistance <= self.distance then
                local canAccess = true
                if (self.job and PlayerJob.name ~= self.job) then
                    canAccess = false
                end
                if canAccess then
                    if not lib.isTextUIOpen() and not hideUI then
                        lib.showTextUI('[E] - '..self.label)
                    end
                    if IsControlJustPressed(0,38) then
                        if lib.isTextUIOpen() then
                            hideUI = true
                            lib.hideTextUI()
                        end
                        if self.event then
                            TriggerEvent(self.event, self.dealership)
                        end
                    end
                end
            end
        end
        function v:onExit()
            hideUI = false
            if lib.isTextUIOpen() then
                lib.hideTextUI()
            end
        end
    end
end