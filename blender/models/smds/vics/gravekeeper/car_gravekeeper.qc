$modelname "car_gravekeeper.mdl"

$body "body" "RPG_Gravekeeper.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/gravekeeper\"

$surfaceprop "metal"

$contents "solid"

$collisionmodel "Gravekeeper_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}

//hull attachments
$attachment "seat1" "root" 15.6 15 20 rotate 0 -90 90
$attachment "seat2" "root" -11 5 20 rotate 0 -90 90

$attachment "turret" "turret_pivot" 0 0 0 rotate 0 0 0
$attachment "gun" "mgun_pivot" 0 0 0 rotate 0 -90 90

$attachment "muzzle_rpg" "mgun_end" 0 0 0 rotate 0 -90 90
$attachment "muzzle_mg_view" "mgun_pivot" -6.5 -15 3.8 rotate 0 -90 90

//wheel attachments
$attachment "L1" "wheel_front_L" 0 0 0 rotate 0 0 0 
$attachment "L2" "wheel_back_L" 0 0 0 rotate 0 0 0 

$attachment "R1" "wheel_front_R" 0 0 0 rotate 0 0 0 
$attachment "R2" "wheel_back_R" 0 0 0 rotate 0 0 0 

//hull animations
$animation "neutral" "anims/Gravekeeper_Idle.smd" frames 0 0

//turret animations
$poseparameter "turret_yaw" 0 360 loop 360 wrap
$weightlist "turret_yaw" { 
"turret_pivot" 0.5
}
$animation "yaw_1" "anims/Gravekeeper_Poses" frame 0 0 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_2" "anims/Gravekeeper_Poses" frame 1 1 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_3" "anims/Gravekeeper_Poses" frame 2 2 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_4" "anims/Gravekeeper_Poses" frame 3 3 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_5" "anims/Gravekeeper_Poses" frame 4 4 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$sequence turret_yaw { 
"yaw_1" "yaw_2" "yaw_3" "yaw_4" "yaw_5" blendwidth 5 blend "turret_yaw" 0 360 weightlist "turret_yaw" delta autoplay
} 


$poseparameter "turret_pitch" -30 25 loop 0
$weightlist "turret_pitch" { 
"mgun_pivot" 1.0 
}
$animation "pitch_min" "anims/Gravekeeper_Poses" frame 5 5 {
	subtract "neutral" 0 weightlist turret_pitch
}
$animation "pitch_max" "anims/Gravekeeper_Poses" frame 6 6 {
	subtract "neutral" 0 weightlist turret_pitch
}
$sequence "turret_pitch" { 
"pitch_min" "pitch_max" blendwidth 2 blend "turret_pitch" -30 25 weightlist "turret_pitch" delta autoplay
} 
