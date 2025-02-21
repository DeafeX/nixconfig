let mapToList = f: attrs: (builtins.map (name: f name attrs.${name}) (builtins.attrNames attrs)); in
toLoad:
	(mapToList (name: value:
		({...}@inputs: let
			moduleValue = import ./${name};
			fArgs = if (builtins.isAttrs value) then value else {};
    	homeConfig = if (moduleValue ? "homeConfig") then { home-manager.users.deafex = (moduleValue.homeConfig fArgs); } else {};	
      nixosConfig = if (moduleValue ? "nixosConfig") then (moduleValue.nixosConfig fArgs inputs) else {};
		in
			nixosConfig // homeConfig
		)		
	) toLoad)
