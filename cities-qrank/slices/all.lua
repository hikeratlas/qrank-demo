local qrank = require 'qrank'
node_keys = {'place'}

function init_function()
	qrank.init()
end

function node_function()
	if Find('place') == 'state' then return end

	local name = Find('name')
	if name == '' then return end

	Layer('places')
	Attribute('name', name)
	ZOrder(qrank.get(Find('wikidata')))
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
