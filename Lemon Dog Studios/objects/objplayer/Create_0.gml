spd = 5
jumpspeed = 150
window_set_caption("Arkangel")
canjump = 0
canjumpset = 5
jumpbuttonpressed = false
crouching = false
jumping = false
//Dash
dashing = false
//Sliding
sliding = false
slidingdirection = 0
slidecool = 0
betweenslidecool = 0
//Controller Deadzone
#macro deadzone = .1
gamepad_set_axis_deadzone(4,deadzone)
gamepad_set_axis_deadzone(0,deadzone)
//Hspeed/Vspeed Subs
hsp = 0
vsp = 0
phy_fixed_rotation = true
//Flare
flaring = 0
flaringcool = 0
activeflaringcool = 0