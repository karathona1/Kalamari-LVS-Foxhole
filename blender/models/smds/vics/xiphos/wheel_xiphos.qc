$modelname "wheel_xiphos.mdl"

$body "body" "Xiphos_Wheel.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/xiphos\"

$surfaceprop "metal"

$contents "solid"

$sequence xiphos_idle "Xiphos_Wheel_Phys.smd" {
	fps 30
}

$collisionmodel "Xiphos_Wheel_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}
