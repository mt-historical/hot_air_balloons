local modname = core.get_current_modname()

if not (mcl_localplayer and mcl_localplayer.set_mount_pose) then
    print("[CSM] " .. modname .. " depends on mcl_localplayer, and therefore the halon build of Luanti. You can get it from https://codeberg.org/halon/mcl_localplayer/.")
    assert(false)
end

assert(core.get_modpath("mcl_localplayer"))

-- Begin hot air balloon
local hot_air_balloon = {
	_is_mountable = true,
	_is_mounted = false,
}

function hot_air_balloon:init_mount()
    core.localplayer:set_velocity(vector.zero())
    mcl_localplayer.set_mount_pose(mcl_localplayer.POSE_STANDING)
end

function hot_air_balloon:dismount()
	mcl_localplayer.set_mount_pose(mcl_localplayer.POSE_MOUNTED)
end

core.register_entity("hot_air_balloons:balloon", hot_air_balloon)

print("[CSM] loaded Hot Air Balloons")
