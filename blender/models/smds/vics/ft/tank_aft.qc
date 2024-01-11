$modelname "tank_aft.mdl"

$body "body" "127_FT.smd"

$opaque

$ambientboost

$cdmaterials "vehicles/aft\"

$surfaceprop "metal"

$contents "solid"

$sequence FT_idle "anims/FT_Idle.smd" {
	fps 30
}

$collisionmodel "FT_Phys.smd"
{
	$mass 1000
	$inertia 1
	$damping 0
	$rotdamping 0
	$concave
}

//hull attachments

$attachment "chassis" "chassy" 0 0 0 rotate 0 0 0
$attachment "seat1" "chassy" 15.6 15 20 rotate 0 -90 90
$attachment "seat2" "chassy" -11 5 20 rotate 0 -90 90

$attachment "turret" "turret_pivot" 0 0 0 rotate 0 0 0
$attachment "muzzle_mg" "turret_gunPivot" 0 0 0 rotate 0 0 0

$attachment "muzzle_mg1" "turret_gunBarrels_endL" 0 0 0 rotate 0 -90 90
$attachment "muzzle_mg2" "turret_gunBarrels_endR" 0 0 0 rotate 0 -90 90
$attachment "muzzle_mg_view" "turret_gunBarrels" -6.5 -15 3.8 rotate 0 -90 90

//hull animations
$animation "neutral" "anims/FT_Idle.smd" frames 0 0

//turret animations
$poseparameter "turret_yaw" 0 360 loop 360 wrap
$weightlist "turret_yaw" { 
"turret_pivot" 1.0 
}
$animation "yaw_1" "anims/FT_Poses.smd" frame 0 0 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_2" "anims/FT_Poses.smd" frame 1 1 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_3" "anims/FT_Poses.smd" frame 2 2 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_4" "anims/FT_Poses.smd" frame 3 3 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$animation "yaw_5" "anims/FT_Poses.smd" frame 4 4 {
	subtract "neutral" 0 weightlist "turret_yaw"
}
$sequence turret_yaw { 
"yaw_1" "yaw_2" "yaw_3" "yaw_4" "yaw_5" blendwidth 5 blend "turret_yaw" 0 360 weightlist "turret_yaw" delta autoplay
} 


$poseparameter "turret_pitch" -45 30 loop 0
$weightlist "turret_pitch" { 
"turret_gunPivot" 1.0 
}
$animation "pitch_min" "anims/FT_Poses.smd" frame 5 5 {
	subtract "neutral" 0 weightlist turret_pitch
}
$animation "pitch_max" "anims/FT_Poses.smd" frame 6 6 {
	subtract "neutral" 0 weightlist turret_pitch
}
$sequence "turret_pitch" { 
"pitch_min" "pitch_max" blendwidth 2 blend "turret_pitch" -45 30 weightlist "turret_pitch" delta autoplay
} 

//left wheel animations
$poseparameter "spin_wheels_left" -180 180 loop 360
$weightlist l_spin {
	"wheel_big01_L" 1.0
	"wheel_big02_L" 1.0
	"wheel_big03_L" 1.0
	"wheel_big04_L" 1.0
	"wheel_big05_L" 1.0
}

$animation "l_spin1" "anims/FT_Poses.smd" frame 8 8 subtract neutral 0 weightlist l_spin
$animation "l_spin2" "anims/FT_Poses.smd" frame 9 9 subtract neutral 0 weightlist l_spin
$animation "l_spin3" "anims/FT_Poses.smd" frame 10 10 subtract neutral 0 weightlist l_spin
$animation "l_spin4" "anims/FT_Poses.smd" frame 11 11 subtract neutral 0 weightlist l_spin
$animation "l_spin5" "anims/FT_Poses.smd" frame 12 12 subtract neutral 0 weightlist l_spin

$animation sus_max_l "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist l_spin
$animation sus_min_l "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist l_spin
$sequence spin_wheels_left { l_spin1 l_spin2 l_spin3 l_spin4 l_spin5 blendwidth 5 blend "spin_wheels_left" -180 180 } weightlist l_spin delta autoplay

$sequence wheels_l { sus_min_l sus_max_l blendwidth 2 blend "spin_wheels_left" 22 0 } weightlist l_spin delta autoplay

//right wheel animations
$poseparameter "spin_wheels_right" -180 180 loop 360
$weightlist r_spin {
	"treads_wheel_1_R" 1.0
	"treads_wheel_2_R" 1.0
	"treads_wheel_3_R" 1.0
	"treads_wheel_4_R" 1.0
	"treads_wheel_5_R" 1.0
}

$animation "r_spin1" "anims/FT_Poses.smd" frame 8 8 subtract neutral 0 weightlist r_spin
$animation "r_spin2" "anims/FT_Poses.smd" frame 9 9 subtract neutral 0 weightlist r_spin
$animation "r_spin3" "anims/FT_Poses.smd" frame 10 10 subtract neutral 0 weightlist r_spin
$animation "r_spin4" "anims/FT_Poses.smd" frame 11 11 subtract neutral 0 weightlist r_spin
$animation "r_spin5" "anims/FT_Poses.smd" frame 12 12 subtract neutral 0 weightlist r_spin
$sequence spin_wheels_right { r_spin1 r_spin2 r_spin3 r_spin4 r_spin5 blendwidth 5 blend "spin_wheels_right" -180 180 } weightlist r_spin delta autoplay

//suspensions right
$poseparameter "suspension_right_1" 0 8 loop 0
$weightlist sus_r1 {
	"suspension_1_R" 1.0
}
$animation sus_r1_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_r1
$animation sus_r1_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_r1
$sequence sus_r1 { sus_r1_min sus_r1_max blendwidth 2 blend "suspension_right_1" 0 14 } weightlist sus_r1 delta autoplay

$poseparameter "suspension_right_2" 0 14 loop 0
$weightlist sus_r2 {
	"suspension_2_R" 1.0
}
$animation sus_r2_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_r2
$animation sus_r2_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_r2
$sequence sus_r2 { sus_r2_min sus_r2_max blendwidth 2 blend "suspension_right_2" 0 14 } weightlist sus_r2 delta autoplay

$poseparameter "suspension_right_3" 0 14 loop 0
$weightlist sus_r3 {
	"suspension_3_R" 1.0
}
$animation sus_r3_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_r3
$animation sus_r3_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_r3
$sequence sus_r3 { sus_r3_min sus_r3_max blendwidth 2 blend "suspension_right_3" 0 14 } weightlist sus_r3 delta autoplay

$poseparameter "suspension_right_4" 0 14 loop 0
$weightlist sus_r4 {
	"suspension_4_R" 1.0
}
$animation sus_r4_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_r4
$animation sus_r4_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_r4
$sequence sus_r4 { sus_r4_min sus_r4_max blendwidth 2 blend "suspension_right_4" 0 14 } weightlist sus_r4 delta autoplay

$poseparameter "suspension_right_5" 0 14 loop 0
$weightlist sus_r5 {
	"suspension_5_R" 1.0
}
$animation sus_r5_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_r5
$animation sus_r5_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_r5
$sequence sus_r5 { sus_r5_min sus_r5_max blendwidth 2 blend "suspension_right_5" 0 14 } weightlist sus_r5 delta autoplay

//suspensions left
$poseparameter "suspension_left_1" 0 14 loop 0
$weightlist sus_l1 {
	"suspension_1_L" 1.0
}
$animation sus_l1_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l1
$animation sus_l1_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_l1
$sequence sus_l1 { sus_l1_min sus_l1_max blendwidth 2 blend "suspension_left_1" 0 14 } weightlist sus_l1 delta autoplay

$poseparameter "suspension_left_2" 0 14 loop 0
$weightlist sus_l2 {
	"suspension_2_L" 1.0
}
$animation sus_l2_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l2
$animation sus_l2_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_l2
$sequence sus_l2 { sus_l2_min sus_l2_max blendwidth 2 blend "suspension_left_2" 0 14 } weightlist sus_l2 delta autoplay

$poseparameter "suspension_left_3" 0 14 loop 0
$weightlist sus_l3 {
	"suspension_3_L" 1.0
}
$animation sus_l3_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l3
$animation sus_l3_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_l3
$sequence sus_l3 { sus_l3_min sus_l3_max blendwidth 2 blend "suspension_left_3" 0 14 } weightlist sus_l3 delta autoplay

$poseparameter "suspension_left_4" 0 14 loop 0
$weightlist sus_l4 {
	"suspension_4_L" 1.0
}
$animation sus_l4_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l4
$animation sus_l4_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_l4
$sequence sus_l4 { sus_l4_min sus_l4_max blendwidth 2 blend "suspension_left_4" 0 14 } weightlist sus_l4 delta autoplay

$poseparameter "suspension_left_5" 0 14 loop 0
$weightlist sus_l5 {
	"suspension_5_L" 1.0
}
$animation sus_l5_min "anims/FT_Poses.smd" frame 6 6 subtract neutral 0 weightlist sus_l5
$animation sus_l5_max "anims/FT_Poses.smd" frame 5 5 subtract neutral 0 weightlist sus_l5
$sequence sus_l5 { sus_l5_min sus_l5_max blendwidth 2 blend "suspension_left_5" 0 14 } weightlist sus_l5 delta autoplay
