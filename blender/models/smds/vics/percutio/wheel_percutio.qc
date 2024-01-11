$modelname "wheel_percutio.mdl"

$body "body" "Percutio_Wheel.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/percutio\"

$surfaceprop "metal"

$contents "solid"

$sequence percutio_idle "Percutio_Wheel_Phys.smd" {
	fps 30
}

$collisionmodel "Percutio_Wheel_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}
