$modelname "wheel_obrien.mdl"

$body "body" "OBrien_Wheel.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/obrien\"

$surfaceprop "metal"

$contents "solid"

$sequence obrien_idle "OBrien_Wheel_Phys.smd" {
	fps 30
}

$collisionmodel "OBrien_Wheel_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}
