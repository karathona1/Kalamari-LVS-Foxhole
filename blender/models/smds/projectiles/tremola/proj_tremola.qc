$modelname "proj_tremola.mdl"

$body "body" "Projectile_TREMOLA.smd"

$opaque

$ambientboost

$cdmaterials "projectiles/tremola\"

$surfaceprop "metal"

$contents "solid"

$sequence "idle" "Projectile_TREMOLA_Phys.smd" {
	fps 30
}

$collisionmodel "Projectile_TREMOLA_Phys.smd"
{
	$mass 10
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}