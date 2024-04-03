"
thisNotebook title: 'Microdown to Pango'.

""

# The internals

## Section numberings

Section numbering is an addition to the classic rendering of _Microdown_ objects.

At first, have a look at the instance variable `sectionsNumbering`, initialized in

""

(PangoMarkupMicrodownVisitor slotNamed: #sectionsNumbering) usingMethods collect: #displayString as: Array.

PangoMarkupMicrodownVisitor>>#initialize.

""

as an empty dictionary.

""

Smalltalk os current lineEnding .

"" Here is some code

```language=json&caption=some code
{ """"hello"""": 3 }
```

also after some text appears.

Here there is one more Lua chunk:

```language=lua
local op = require 'operator'

---[[
local a, b = 3, 4

local v = op.call_with_current_continuation (
	function (k, v) print (v); return v end,
	function (k) return 3 + k (k, a + b) end
)

print (v)
--]]


local function explicit_requirement (name) 
    return function (cat)
        error (string.format ('%s has to explicitly implement `%s`.', cat, name)) 
    end
end
```

""

thisNotebook doLuaChunk: '

function adder (a)
	return function (b)
		return a + b
	end
end

'.

thisNotebook doLuaChunk: '

a = adder (3) (4)

'.

thisNotebook doLuaChunk: '

return a, ""hello, Lua!""

'.

thisNotebook doLuaChunk: '
op = require ''operator'''.


thisNotebook doLuaChunk: '

--[[
local a, b = 3, 4

local v = op.call_with_current_continuation (
	function (k, v) print (v); return v end,
	function (k) return 3 + k (k, a + b) end
)

print (v)
--]]


local function explicit_requirement (name) 
    return function (cat)
        error (string.format (''%s has to explicitly implement `%s`.'', cat, name)) 
    end
end

local category = {
    traits = {},
    data = {
        maybe = {},
    },
}

category.traits.monoid = { 
    mempty = explicit_requirement ''mempty'',
    mappend = explicit_requirement ''mappend'',
    mpow = function (cat, n)

        -- mpow :: Monoid w => int -> w -> w

        local a, r = cat, cat:mempty()

        while true do

            if n % 2 == 1 then
                r = a:mappend (r)
                if n == 1 then return r end
            elseif n == 0 then return r end
            
            a = a:mappend (a)
            n = n // 2
            
        end
    end,
}

category.traits.functor = { 
    fmap = explicit_requirement ''fmap'',
}

category.traits.applicative = { 
    pure = explicit_requirement ''pure'',
    amap = explicit_requirement ''amap'',
}

setmetatable (category.traits.applicative, {
    __index = category.traits.functor,
})

--[[
    Nothing
]]
category.data.maybe.nothing = {
    mempty = function (cat) return cat end,
    mappend = function (cat, another) return another end,
    fmap = function (cat, f) return cat end 
}

setmetatable (category.data.maybe.nothing, {
    __index = function (cat, key)
        return category.traits.monoid[key]
            or category.traits.functor[key]
    end
})

category.traits.just = { 
    mempty = function (cat) return category.data.maybe.nothing end,
    mappend = function (cat, another) return category.data.maybe.just (cat.value:mappend (another.value)) end,
    fmap = function (cat, f) return category.data.maybe.just (cat.value:fmap (f)) end
}

setmetatable (category.traits.just, {
    __index = function (cat, key)
        return category.traits.monoid[key]
            or category.traits.functor[key]
    end
})

function category.data.maybe.just (v)

    local cat = { value = v }
    
    setmetatable (cat, {
        __index = category.traits.just,
        __tostring = function (cat) return string.format (''(%s) :: just'', cat.value) end
    })
    
    return cat

end

function category.data.table (tbl)

    local cat = { 
        value = tbl,
        fmap = function (cat, f)
            local tbl = {}
            for k, v in pairs (cat.value) do tbl[k] = f (v) end
            return category.data.table (tbl)
        end
    }
    
    setmetatable (cat, {
        __index = function (cat, key)
            return category.traits.functor[key]
        end,
        __tostring = function (cat) return string.format (''(%s) :: table'', cat.value) end
    })
    
    return cat

end

C = category

return category'.

thisNotebook doLuaChunk: '


local a = C.data.table { ''hello'', ''world!'', hello = ''beatiful''}

return tostring (C.data.maybe.just (a):fmap(op.len))

'
	

"
Class {
	#name : 'BookletDSstLuaNotebook',
	#superclass : 'CTClassCommentAutoNotebook',
	#category : 'Booklet-DSst-Tests',
	#package : 'Booklet-DSst-Tests'
}
