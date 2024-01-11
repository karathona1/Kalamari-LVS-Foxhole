$modelname "car_percutio.mdl"

$body "body" "20_Percutio.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/percutio\"

$surfaceprop "metal"

$contents "solid"

$sequence percutio_idle "anims/idle.smd" {
	fps 30
}

$collisionmodel "Xiphos_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}

//hull attachments
$attachment "seat1" "chassis" 15.6 15 20 rotate 0 -90 90
$attachment "seat2" "chassis" -11 5 20 rotate 0 -90 90

$attachment "turret" "turret_pivot" 0 0 0 rotate 0 0 0
$attachment "muzzle_cannon" "mgun_pivot" 0 0 0 rotate 0 0 0
$attachment "muzzle_end" "ATgun_end" 0 0 0 rotate 0 -90 90

//wheel attachments
$attachment "L1" "wheel_front_L" 0 0 0 rotate 0 0 0 
$attachment "L2" "wheel_back_L" 0 0 0 rotate 0 0 0 

$attachment "R1" "wheel_front_R" 0 0 0 rotate 0 0 0 
$attachment "R2" "wheel_back_R" 0 0 0 rotate 0 0 0 

//hull animations
$animation "neutral" "anims/idle.smd" frames 0 0

//turret animations
$poseparameter "turret_yaw" 0 360 loop 360 wrap
$weightlist "turret_yaw" { 
"turret_pivot" 1.0 
}
$animation "yaw_1" "anims/poses" frame 1 1 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_2" "anims/poses" frame 2 2 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_3" "anims/poses" frame 3 3 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_4" "anims/poses" frame 4 4 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_5" "anims/poses" frame 5 5 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$sequence turret_yaw { 
"yaw_1" "yaw_2" "yaw_3" "yaw_4" "yaw_5" blendwidth 5 blend "turret_yaw" 0 360 weightlist "turret_yaw" delta autoplay
} 


$poseparameter "turret_pitch" -11 11 loop 0
$weightlist "turret_pitch" { 
"mgun_pivot" 1.0 
}
$animation "pitch_min" "anims/poses" frame 6 6 {
	subtract "neutral" 0 weightlist turret_pitch
}
$animation "pitch_max" "anims/poses" frame 7 7 {
	subtract "neutral" 0 weightlist turret_pitch
}
$sequence "turret_pitch" { 
"pitch_min" "pitch_max" blendwidth 2 blend "turret_pitch" -30 22 weightlist "turret_pitch" delta autoplay
} 
