$modelname "tank_ixion.mdl"

$body "body" "30_Ixion.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/ixion\"

$surfaceprop "metal"

$contents "solid"

$collisionmodel "Ixion_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}

//hull attachments
$attachment "seat1" "axle_pivot" 15.6 15 20 rotate 0 -90 90

$attachment "seat2" "axle_pivot" -11 5 20 rotate 0 -90 90

$attachment "muzzle_cannon" "Gun_verticalPivot" 0 0 0 rotate 0 -90 90
$attachment "muzzle_end" "Gun_barrel_end" 0 0 0 rotate 0 -90 90

//wheel attachments
$attachment "vehicle_wheel_l_1" "root" 30 50 61.2 rotate 0 0 0 
$attachment "vehicle_wheel_l_2" "root" 30 50 29 rotate 0 0 0 
$attachment "vehicle_wheel_l_3" "root" 30 50 -2.5 rotate 0 0 0 
$attachment "vehicle_wheel_l_4" "root" 30 50 -34 rotate 0 0 0 
$attachment "vehicle_wheel_l_5" "root" 30 50 -70 rotate 0 0 0 

$attachment "vehicle_wheel_r_1" "root" -30 50 61.2 rotate 0 0 0 
$attachment "vehicle_wheel_r_2" "root" -30 50 29  rotate 0 0 0 
$attachment "vehicle_wheel_r_3" "root" -30 50 -2.5  rotate 0 0 0 
$attachment "vehicle_wheel_r_4" "root" -30 50 -34  rotate 0 0 0 
$attachment "vehicle_wheel_r_5" "root" -30 50 -70  rotate 0 0 0 

//hull animations
$animation "neutral" "anims/Ixion_Idle.smd" frames 0 0

$weightlist gun_pitch { "Gun_verticalPivot" 0.5 }
$weightlist gun_yaw { "Gun_horizontalPivot" 1.0 }

$poseparameter gun_pitch -30 25
$animation "pitch_min" "anims/Ixion_Poses.smd" frame 3 3 subtract neutral 0 weightlist gun_pitch
$animation "pitch_max" "anims/Ixion_Poses.smd" frame 4 4 subtract neutral 0 weightlist gun_pitch
$sequence gun_pitch { pitch_min pitch_max blendwidth 2 blend "gun_pitch" -30 25 } weightlist gun_pitch delta autoplay

$poseparameter gun_yaw -35 35
$animation "yaw_min" "anims/Ixion_Poses.smd" frame 1 1 subtract neutral 0 weightlist gun_yaw
$animation "yaw_max" "anims/Ixion_Poses.smd" frame 2 2 subtract neutral 0 weightlist gun_yaw
$sequence gun_yaw { yaw_min yaw_max blendwidth 2 blend "gun_yaw" -35 35 } weightlist gun_yaw delta autoplay

//left wheel animations
$poseparameter "spin_wheels_left" -180 180 loop 360
$weightlist l_spin {
	"vehicle_wheel_l_1" 1.0
	"vehicle_wheel_l_2" 1.0
	"vehicle_wheel_l_3" 1.0
	"vehicle_wheel_l_4" 1.0
	"vehicle_wheel_l_5" 1.0
}

$animation "l_spinmin" "anims/Ixion_Poses.smd" frame 0 0 subtract neutral 0 weightlist l_spin
$animation "l_spinmax" "anims/Ixion_Poses.smd" frame 5 5 subtract neutral 0 weightlist l_spin
$sequence spin_wheels_left { l_spinmax l_spinmin blendwidth 2 blend "spin_wheels_left" -180 180 } weightlist l_spin delta autoplay

//right wheel animations
$poseparameter "spin_wheels_right" -180 180 loop 360
$weightlist r_spin {
	"vehicle_wheel_r_1" 1.0
	"vehicle_wheel_r_2" 1.0
	"vehicle_wheel_r_3" 1.0
	"vehicle_wheel_r_4" 1.0
	"vehicle_wheel_r_5" 1.0
}

$animation "r_spinmin" "anims/Ixion_Poses.smd" frame 0 0 subtract neutral 0 weightlist r_spin
$animation "r_spinmax" "anims/Ixion_Poses.smd" frame 6 6 subtract neutral 0 weightlist r_spin
$sequence spin_wheels_right { r_spinmax r_spinmin blendwidth 2 blend "spin_wheels_right" -180 180 } weightlist r_spin delta autoplay

//suspensions right
$poseparameter "suspension_right_1" 0 14 loop 0
$weightlist sus_r1 {
	"suspension_1_R" 1.0
}
$animation "sus_r1_min" "anims/Ixion_Poses.smd" frame 11 11 subtract neutral 0 weightlist sus_r1
$animation "sus_r1_max" "anims/Ixion_Poses.smd" frame 12 12 subtract neutral 0 weightlist sus_r1
$sequence sus_r1 { sus_r1_min sus_r1_max blendwidth 2 blend "suspension_right_1" 0 14 } weightlist sus_r1 delta autoplay

$poseparameter "suspension_right_2" 0 14 loop 0
$weightlist sus_r2 {
	"suspension_2_R" 1.0
}
$animation "sus_r2_min" "anims/Ixion_Poses.smd" frame 12 12 subtract neutral 0 weightlist sus_r2
$animation "sus_r2_max" "anims/Ixion_Poses.smd" frame 13 13 subtract neutral 0 weightlist sus_r2
$sequence sus_r2 { sus_r2_min sus_r2_max blendwidth 2 blend "suspension_right_2" 0 14 } weightlist sus_r2 delta autoplay

$poseparameter "suspension_right_3" 0 14 loop 0
$weightlist sus_r3 {
	"suspension_3_R" 1.0
}
$animation "sus_r3_min" "anims/Ixion_Poses.smd" frame 13 13 subtract neutral 0 weightlist sus_r3
$animation "sus_r3_max" "anims/Ixion_Poses.smd" frame 14 14 subtract neutral 0 weightlist sus_r3
$sequence sus_r3 { sus_r3_min sus_r3_max blendwidth 2 blend "suspension_right_3" 0 14 } weightlist sus_r3 delta autoplay

$poseparameter "suspension_right_4" 0 14 loop 0
$weightlist sus_r4 {
	"suspension_4_R" 1.0
}
$animation "sus_r4_min" "anims/Ixion_Poses.smd" frame 14 14 subtract neutral 0 weightlist sus_r4
$animation "sus_r4_max" "anims/Ixion_Poses.smd" frame 15 15 subtract neutral 0 weightlist sus_r4
$sequence sus_r4 { sus_r4_min sus_r4_max blendwidth 2 blend "suspension_right_4" 0 14 } weightlist sus_r4 delta autoplay

$poseparameter "suspension_right_5" 0 14 loop 0
$weightlist sus_r5 {
	"suspension_5_R" 1.0
}
$animation "sus_r5_min" "anims/Ixion_Poses.smd" frame 15 15 subtract neutral 0 weightlist sus_r5
$animation "sus_r5_max" "anims/Ixion_Poses.smd" frame 16 16 subtract neutral 0 weightlist sus_r5
$sequence sus_r5 { sus_r5_min sus_r5_max blendwidth 2 blend "suspension_right_5" 0 14 } weightlist sus_r5 delta autoplay

//suspensions left
$poseparameter "suspension_left_1" 0 14 loop 0
$weightlist sus_l1 {
	"suspension_1_L" 1.0
}
$animation "sus_l1_min" "anims/Ixion_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l1
$animation "sus_l1_max" "anims/Ixion_Poses.smd" frame 7 7 subtract neutral 0 weightlist sus_l1
$sequence sus_l1 { sus_l1_min sus_l1_max blendwidth 2 blend "suspension_left_1" 0 14 } weightlist sus_l1 delta autoplay

$poseparameter "suspension_left_2" 0 14 loop 0
$weightlist sus_l2 {
	"suspension_2_L" 1.0
}
$animation "sus_l2_min" "anims/Ixion_Poses.smd" frame 7 7 subtract neutral 0 weightlist sus_l2
$animation "sus_l2_max" "anims/Ixion_Poses.smd" frame 8 8 subtract neutral 0 weightlist sus_l2
$sequence sus_l2 { sus_l2_min sus_l2_max blendwidth 2 blend "suspension_left_2" 0 14 } weightlist sus_l2 delta autoplay

$poseparameter "suspension_left_3" 0 14 loop 0
$weightlist sus_l3 {
	"suspension_3_L" 1.0
}
$animation "sus_l3_min" "anims/Ixion_Poses.smd" frame 8 8 subtract neutral 0 weightlist sus_l3
$animation "sus_l3_max" "anims/Ixion_Poses.smd" frame 9 9 subtract neutral 0 weightlist sus_l3
$sequence sus_l3 { sus_l3_min sus_l3_max blendwidth 2 blend "suspension_left_3" 0 14 } weightlist sus_l3 delta autoplay

$poseparameter "suspension_left_4" 0 14 loop 0
$weightlist sus_l4 {
	"suspension_4_L" 1.0
}
$animation "sus_l4_min" "anims/Ixion_Poses.smd" frame 9 9 subtract neutral 0 weightlist sus_l4
$animation "sus_l4_max" "anims/Ixion_Poses.smd" frame 10 10 subtract neutral 0 weightlist sus_l4
$sequence sus_l4 { sus_l4_min sus_l4_max blendwidth 2 blend "suspension_left_4" 0 14 } weightlist sus_l4 delta autoplay

$poseparameter "suspension_left_5" 0 14 loop 0
$weightlist sus_l5 {
	"suspension_5_L" 1.0
}
$animation "sus_l5_min" "anims/Ixion_Poses.smd" frame 10 10 subtract neutral 0 weightlist sus_l5
$animation "sus_l5_max" "anims/Ixion_Poses.smd" frame 11 11 subtract neutral 0 weightlist sus_l5
$sequence sus_l5 { sus_l5_min sus_l5_max blendwidth 2 blend "suspension_left_5" 0 14 } weightlist sus_l5 delta autoplay