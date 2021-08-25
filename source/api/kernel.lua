local module = {ffi = require 'ffi'}

function module.safely_include(mod)
	if not package.loading then package.loading = {} end
	if package.loading[mod] == nil then
		package.loading[mod] = true
		local v = {require(mod)}
		package.loading[mod] = nil
		return unpack(v)
	end
end

return module
