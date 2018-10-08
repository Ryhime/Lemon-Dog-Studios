spd = 5
jumpspeed = 150
window_set_caption("Arkangel")
canjump = 0
jumpbutton = false
jumpbuttonpressed = false
crouching = false
maxjumps = 1
jumping = false
//Shoulder Dash
dashing = false
//Sliding
sliding = false
slidingdirection = 0
slidecool = 0
betweenslidecool = 0
//Controller Deadzone
deadzone = .1
gamepad_set_axis_deadzone(4,deadzone)
gamepad_set_axis_deadzone(0,deadzone)
//Create Fixture
fix = physics_fixture_create()
physics_fixture_set_box_shape(fix,16,32)
physics_fixture_set_density(fix, 0.5);
physics_fixture_set_restitution(fix, 0);
physics_fixture_set_linear_damping(fix, 0);
physics_fixture_set_angular_damping(fix, 0);
physics_fixture_set_friction(fix, 0);
fixture = physics_fixture_bind(fix, id);
physics_fixture_delete(fix)
//Hspeed/Vspeed Subs
hsp = 0
vsp = 0
phy_fixed_rotation = true
