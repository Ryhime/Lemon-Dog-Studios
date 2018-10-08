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
fixture = physics_fixture_create()
physics_fixture_set_box_shape(fixture,16,32)
physics_fixture_set_density(fixture, 0.5);
physics_fixture_set_restitution(fixture, 0);
physics_fixture_set_linear_damping(fixture, 0);
physics_fixture_set_angular_damping(fixture, 0);
physics_fixture_set_friction(fixture, 0);
physics_fixture_bind(fixture, id);
//Hspeed/Vspeed Subs
hsp = 0
vsp = 0
phy_fixed_rotation = true
