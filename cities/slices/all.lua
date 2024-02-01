node_keys = {'place'}

function node_function()
	local name = Find('name')
	if name == '' then return end

	Layer('places')
	Attribute('name', name)
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
