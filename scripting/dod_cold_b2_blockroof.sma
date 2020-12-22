#include <amxmodx>
#include <engine>
#include <fakemeta>
#include <engine>

#define MODEL "models/mapmodels/null.mdl"

public plugin_precache()
{
	precache_model(MODEL)
}

public plugin_init()
{
	register_plugin("dod_cold_b2 block roof access", "1.0", "Fysiks")

	// Allies side
	create_wall(Float:{-735.5, 2384.0, 75.0}, Float:{-50.0, -1.0, -100.0}, Float:{50.0, 1.0, 100.0})
	create_wall(Float:{-800.0, 2343.5, 75.0}, Float:{-1.0, -25.0, -100.0}, Float:{1.0, 25.0, 100.0})

	// Axis side
	create_wall(Float:{-1267.0, -2304.0, 43.0}, Float:{-5.0, -55.0, -50.0}, Float:{5.0, 150.0, 75.0})
}

stock create_wall(Float:fvOrigin[3], Float:mins[3], Float:maxs[3])
{
	// Doesn't seem to work so far.
	new entMyWall = create_entity("func_wall")
	entity_set_string(entMyWall, EV_SZ_classname, "wall")
	entity_set_model(entMyWall, MODEL)

	// Set size and absmin+absmax values
	entity_set_vector(entMyWall, EV_VEC_mins, mins)
	entity_set_vector(entMyWall, EV_VEC_absmin, mins)

	entity_set_vector(entMyWall, EV_VEC_maxs, maxs)
	entity_set_vector(entMyWall, EV_VEC_absmax, maxs)

	// Set angle
	mins[0] = 0.0
	mins[1] = 0.0
	mins[2] = 0.0
	entity_set_vector(entMyWall, EV_VEC_angles, Float:{0.0,0.0,0.0})

	// Get user origin
	entity_set_origin(entMyWall, fvOrigin)

	// Set other values
	entity_set_int(entMyWall, EV_INT_solid, SOLID_BBOX)
	entity_set_int(entMyWall, EV_INT_movetype, MOVETYPE_FLY)

	return entMyWall
}
