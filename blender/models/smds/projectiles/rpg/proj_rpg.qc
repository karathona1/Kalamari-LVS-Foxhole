$modelname "proj_rpg.mdl"

$body "body" "Projectile_RPG.smd"

$opaque

$ambientboost

$cdmaterials "projectiles/rpg\"

$surfaceprop "metal"

$contents "solid"

$sequence "idle" "Projectile_RPG_Phys.smd" {
	fps 30
}

$collisionmodel "Projectile_RPG_Phys.smd"
{
	$mass 10
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}