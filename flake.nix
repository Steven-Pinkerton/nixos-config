{
   inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.05";
   outputs = { self, nixpkgs }: 
   {
       nixosConfigurations.vm-nixos = nixpkgs.lib.nixosSystem 
       {
           system = "x86_64-linux";
           modules = 
	   [
	      (import ./configuration.nix)
	   ]
       }
   };
}

