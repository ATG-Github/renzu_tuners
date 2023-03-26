CreateRadialMenu = function()
	if not lib.addRadialItem then return end


	for k, v in pairs(config.radialoptions) do
		for _, coord in pairs(v.coords) do
			local point = lib.points.new(coord, 5)
			print(
				"Creating radial menu for " .. v.id .. " at " .. coord.x .. ", " .. coord.y .. ", " .. coord.z
			)

			function point:onEnter()
				lib.addRadialItem({
					id = 'tuners_menu_'..v.id .. "_" .. _,
					icon = v.icon,
					label = v.label,
					menu = 'tuners_menu_'..v.id .. "_" .. _,
				})
				lib.registerRadial({
					id = 'tuners_menu_'..v.id .. "_" .. _,
					items = v
				})
			end
		
			function point:onExit()
				lib.removeRadialItem('tuners_menu_'..v.id .. "_" .. _)
			end
		end
	end
end

HasRadialMenu = function()
	if not lib.addRadialItem then return end
	for k, v in pairs(config.radialoptions) do
		for _, coord in pairs(v.coords) do
			lib.removeRadialItem('tuners_menu_'..v.id .. "_" .. _)
		end
	end
	if HasAccess() then
		return CreateRadialMenu()
	end
end
