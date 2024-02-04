node_keys = {'place'}

function node_function()
	local name = Find('name')
	if name == '' then return end

	Layer('places')
	Attribute('name', name)
	local rank = 1
	local place = Find('place')
	if place == 'hamlet' then rank = 2 end
	if place == 'town' then rank = 3 end
	if place == 'village' then rank = 4 end
	if place == 'city' then rank = 5 end
	ZOrder(rank)
end

function way_function()
end

function relation_scan_function()
	if Find('boundary') == 'administrative' and Find('admin_level') == '4' then
		Accept()
	end
end

function relation_function()
	if Find('boundary') == 'administrative' and Find('admin_level') == '4' then
		Layer('boundaries')
	end
end
