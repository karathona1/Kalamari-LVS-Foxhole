$modelname "car_obrien_destroyed.mdl"

$body "body" "OBrien_Destroyed.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/obrien\"

$surfaceprop "metal"

$contents "solid"

$sequence obrien_idle "OBrien_Destroyed.smd" {
	fps 30
}

$collisionmodel "OBrien_Destroyed.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}