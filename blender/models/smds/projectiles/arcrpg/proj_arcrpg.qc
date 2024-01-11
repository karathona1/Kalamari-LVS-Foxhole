$modelname "proj_arcrpg.mdl"

$body "body" "Projectile_ARC_RPG.smd"

$opaque

$ambientboost

$cdmaterials "projectiles/arcrpg\"

$surfaceprop "metal"

$contents "solid"

$sequence "idle" "Projectile_ARC_RPG_Phys.smd" {
	fps 30
}

$collisionmodel "Projectile_ARC_RPG_Phys.smd"
{
	$mass 20
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}