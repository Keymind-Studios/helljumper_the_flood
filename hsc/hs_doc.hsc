; AVAILABLE FUNCTIONS:

(<passthrough> begin <expression(s)>)
; returns the last expression in a sequence after evaluating the sequence in order.

(<passthrough> begin_random <expression(s)>)
; evaluates the sequence of expressions in random order and returns the last value evaluated.

(<passthrough> if <boolean> <then> [<else>])
; returns one of two values based on the value of a condition.

(<passthrough> cond (<boolean1> <result1>) [(<boolean2> <result2>) [...]])
; returns the value associated with the first true condition.

(<passthrough> set <variable name> <expression>)
; set the value of a global variable.

(<boolean> and <boolean(s)>)
; returns true if all specified expressions are true.

(<boolean> or <boolean(s)>)
; returns true if any specified expressions are true.

(<real> + <number(s)>)
; returns the sum of all specified expressions.

(<real> - <number> <number>)
; returns the difference of two expressions.

(<real> * <number(s)>)
; returns the product of all specified expressions.

(<real> / <number> <number>)
; returns the quotient of two expressions.

(<real> min <number(s)>)
; returns the minimum of all specified expressions.

(<real> max <number(s)>)
; returns the maximum of all specified expressions.

(<boolean> = <expression> <expression>)
; returns true if two expressions are equal

(<boolean> != <expression> <expression>)
; returns true if two expressions are not equal

(<boolean> > <number> <number>)
; returns true if the first number is larger than the second.

(<boolean> < <number> <number>)
; returns true if the first number is smaller than the second.

(<boolean> >= <number> <number>)
; returns true if the first number is larger than or equal to the second.

(<boolean> <= <number> <number>)
; returns true if the first number is smaller than or equal to the second.

(<void> sleep <short> [<script>])
; pauses execution of this script (or, optionally, another script) for the specified number of ticks.

(<void> sleep_forever [<script>])
; pauses execution of this script (or, optionally, another script) forever.
; NETWORK SAFE: Yes

(<void> sleep_until <boolean> [<short>] [<long>])
; pauses execution of this script until the specified condition is true, checking once per second unless a different number of ticks is specified, or until the specified number of ticks has passed.

(<void> wake <script name>)
; wakes a sleeping script in the next update.

(<void> inspect <expression>)
; prints the value of an expression to the screen for debugging purposes.

(<unit> unit <object>)
; converts an object to a unit.

(<void> ai_debug_communication_suppress <string(s)>)
; suppresses (or stops suppressing) a set of AI communication types.

(<void> ai_debug_communication_ignore <string(s)>)
; ignores (or stops ignoring) a set of AI communication types when printing out communications.

(<void> ai_debug_communication_focus <string(s)>)
; focuses (or stops focusing) a set of unit vocalization types.

(<boolean> not <boolean>)
; returns the opposite of the expression.

(<real> pin <real> <real> <real>)
; returns the first value pinned between the second two

(<void> debug_script_thread <string> <boolean>)
; Verbose threads spew to log about script and function calls.
; NETWORK SAFE: Yes

(<void> debug_scripting <boolean>)
; Turn on/off hs script debugging.
; NETWORK SAFE: Yes

(<void> breakpoint <string>)
; If breakpoints are enabled, pause execution when this statement is hit (displaying the given message).
; NETWORK SAFE: Yes

(<void> kill_active_scripts)
; Terminates all currently running threads.
; NETWORK SAFE: Unknown, assumed unsafe

(<long> get_executing_running_thread)
; Retrieves the current executing thread index
; NETWORK SAFE: Unknown, assumed unsafe

(<void> kill_thread <long>)
; Kill the specified thread
; NETWORK SAFE: Unknown, assumed unsafe

(<boolean> script_started <string>)
; Returns true if the continuous, dormant or startup script was started.
; NETWORK SAFE: Yes

(<boolean> script_finished <string>)
; Returns true if the continuous, dormant or startup script was finished.
; NETWORK SAFE: Yes

(<long> abs_integer <long>)
; return the absolute (non-negative) value of an integer

(<real> abs_real <real>)
; return the absolute (non-negative) value of a real

(<long> bitwise_and <long> <long>)
; <lhs> AND <rhs>

(<long> bitwise_or <long> <long>)
; <lhs> OR <rhs>

(<long> bitwise_xor <long> <long>)
; <lhs> XOR <rhs>

(<long> bitwise_left_shift <long> <short>)
; <value> LHS <bit_count>

(<long> bitwise_right_shift <long> <short>)
; <value> RHS <bit_count>

(<long> bit_test <long> <short>)
; <flags> <bit_index>

(<long> bit_toggle <long> <short> <boolean>)
; <flags> <bit_index> <on_or_off>

(<long> bitwise_flags_toggle <long> <long> <boolean>)
; <value> <flags> <on_or_off>

(<void> print <string>)
; prints a string to the console.

(<void> print_if <boolean> <string>)
; prints a string to the console if the condition is true.

(<void> log_print <string>)
; prints a string to the hs log file.

(<object_list> local_players)
; returns a list of the living player units on the local machine

(<object_list> players)
; returns a list of the players

(<object_list> players_on_multiplayer_team <short>)
; returns a list of the living player units on the MP team

(<void> volume_teleport_players_not_inside <trigger_volume> <cutscene_flag>)
; moves all players outside a specified trigger volume to a specified flag.

(<boolean> volume_test_object <trigger_volume> <object>)
; returns true if the specified object is within the specified volume.

(<boolean> volume_test_objects <trigger_volume> <object_list>)
; returns true if any of the specified objects are within the specified volume.

(<boolean> volume_test_objects_all <trigger_volume> <object_list>)
; returns true if any of the specified objects are within the specified volume.

(<void> object_teleport <object> <cutscene_flag>)
; moves the specified object to the specified flag.

(<void> object_set_facing <object> <cutscene_flag>)
; turns the specified object in the direction of the specified flag.

(<void> object_set_shield <object> <real>)
; sets the shield vitality of the specified object (between 0 and 1).

(<void> object_set_permutation <object> <string> <string>)
; sets the desired region (use "" for all regions) to the permutation with the given name, e.g. (object_set_permutation flood "right arm" ~damaged)

(<void> object_create <object_name>)
; creates an object from the scenario.

(<void> object_destroy <object>)
; destroys an object.

(<void> object_create_anew <object_name>)
; creates an object, destroying it first if it already exists.

(<void> object_create_containing <string>)
; creates all objects from the scenario whose names contain the given substring.

(<void> object_create_anew_containing <string>)
; creates anew all objects from the scenario whose names contain the given substring.

(<void> object_destroy_containing <string>)
; destroys all objects from the scenario whose names contain the given substring.

(<void> object_destroy_all)
; destroys all non player objects.

(<void> objects_delete_by_definition <object_definition>)
; deletes all objects of type <definition>

(<object> list_get <object_list> <short>)
; returns an item in an object list.

(<short> list_count <object_list>)
; returns the number of objects in a list

(<short> list_count_not_dead <object_list>)
; returns the number of objects in a list that aren't dead

(<void> effect_new <effect> <cutscene_flag>)
; starts the specified effect at the specified flag.

(<void> effect_new_on_object_marker <effect> <object> <string>)
; starts the specified effect on the specified object at the specified marker.

(<void> damage_new <damage> <cutscene_flag>)
; causes the specified damage at the specified flag.

(<void> damage_object <damage> <object>)
; causes the specified damage at the specified object.

(<boolean> objects_can_see_object <object_list> <object> <real>)
; returns true if any of the specified units are looking within the specified number of degrees of the object.

(<boolean> objects_can_see_flag <object_list> <cutscene_flag> <real>)
; returns true if any of the specified units are looking within the specified number of degrees of the flag.

(<real> objects_distance_to_object <object_list> <object>)
; returns minimum distance from any of the specified objects to the specified destination object. (returns -1 if there are no objects to check)

(<real> objects_distance_to_flag <object_list> <cutscene_flag>)
; returns minimum distance from any of the specified objects to the specified flag. (returns -1 if there are no objects, or no flag, to check)

(<real> objects_distance_to_position <object_list> <real> <real> <real>)
; returns minimum distance from any of the specified objects to the specified position. (returns -1 if there are no objects to check)

(<void> sound_set_gain <string> <real>)
; absolutely do not use this

(<real> sound_get_gain <string>)
; absolutely do not use this either

(<void> script_recompile)
; recompiles scripts.

(<void> script_doc)
; saves a file called hs_doc.txt with parameters for all script commands.

(<void> help <string>)
; prints a description of the named function.

(<short> random_range <short> <short>)
; returns a random value in the range [lower bound, upper bound)

(<real> real_random_range <real> <real>)
; returns a random value in the range [lower bound, upper bound)

(<void> physics_constants_reset)
; resets all physics constants to earthly values

(<void> physics_set_gravity <real>)
; set global gravity acceleration relative to halo standard gravity

(<real> physics_get_gravity)
; get the current global gravity acceleration relative to halo standard gravity

(<void> numeric_countdown_timer_set <long> <boolean>)
; <milliseconds>, <auto_start>

(<short> numeric_countdown_timer_get <short>)
; <digit_index>

(<void> numeric_countdown_timer_stop)

(<void> numeric_countdown_timer_restart)

(<void> breakable_surfaces_enable <boolean>)
; enables or disables breakability of all breakable surfaces on level

(<boolean> recording_play <unit> <cutscene_recording>)
; make the specified unit run the specified cutscene recording.

(<boolean> recording_play_and_delete <unit> <cutscene_recording>)
; make the specified unit run the specified cutscene recording, deletes the unit when the animation finishes.

(<boolean> recording_play_and_hover <vehicle> <cutscene_recording>)
; make the specified vehicle run the specified cutscene recording, hovers the vehicle when the animation finishes.

(<void> recording_kill <unit>)
; kill the specified unit's cutscene recording.

(<short> recording_time <unit>)
; return the time remaining in the specified unit's cutscene recording.

(<void> object_set_ranged_attack_inhibited <object> <boolean>)
; FALSE prevents object from using ranged attack

(<void> object_set_melee_attack_inhibited <object> <boolean>)
; FALSE prevents object from using melee attack

(<void> objects_dump_memory)
; debugs object memory usage

(<void> object_set_collideable <object> <boolean>)
; FALSE prevents any object from colliding with the given object

(<void> object_set_scale <object> <real> <short>)
; sets the scale for a given object and interpolates over the given number of frames to achieve that scale

(<void> objects_attach <object> <string> <object> <string>)
; attaches the second object to the first; both strings can be empty

(<void> objects_detach <object> <object>)
; detaches from the given parent object the given child object

(<void> garbage_collect_now)
; causes all garbage objects except those visible to a player to be collected immediately

(<void> object_cannot_take_damage <object_list>)
; prevents an object from taking damage

(<void> object_can_take_damage <object_list>)
; allows an object to take damage again

(<void> object_beautify <object> <boolean>)
; makes an object pretty for the remainder of the levels' cutscenes.

(<void> objects_predict <object_list>)
; loads textures necessary to draw a objects that are about to come on-screen.

(<void> object_type_predict <object_definition>)
; loads textures necessary to draw an object that's about to come on-screen.

(<void> object_pvs_activate <object>)
; just another (old) name for object_pvs_set_object.

(<void> object_pvs_set_object <object>)
; sets the specified object as the special place that activates everything it sees.

(<void> object_pvs_set_camera <cutscene_camera_point>)
; sets the specified cutscene camera point as the special place that activates everything it sees.

(<void> object_pvs_clear)
; removes the special place that activates everything it sees.

(<boolean> render_lights <boolean>)
; enables/disables dynamic lights

(<short> scenery_get_animation_time <scenery>)
; returns the number of ticks remaining in a custom animation (or zero, if the animation is over).

(<void> scenery_animation_start <scenery> <animation_graph> <string>)
; starts a custom animation playing on a piece of scenery

(<void> scenery_animation_start_at_frame <scenery> <animation_graph> <string> <short>)
; starts a custom animation playing on a piece of scenery at a specific frame

(<void> render_effects <boolean>)

(<void> unit_can_blink <unit> <boolean>)
; allows a unit to blink or not (units never blink when they are dead)

(<void> unit_open <unit>)
; opens the hatches on the given unit

(<void> unit_close <unit>)
; closes the hatches on a given unit

(<void> unit_kill <unit>)
; kills a given unit, no saving throw

(<void> unit_kill_silent <unit>)
; kills a given unit silently (doesn't make them play their normal death animation or sound)

(<short> unit_get_custom_animation_time <unit>)
; returns the number of ticks remaining in a unit's custom animation (or zero, if the animation is over).

(<void> unit_stop_custom_animation <unit>)
; stops the custom animation running on the given unit.

(<boolean> unit_custom_animation_at_frame <unit> <animation_graph> <string> <boolean> <short>)
; starts a custom animation playing on a unit at a specific frame index(interpolates into animation if next to last parameter is TRUE)

(<boolean> custom_animation <unit> <animation_graph> <string> <boolean>)
; starts a custom animation playing on a unit (interpolates into animation if last parameter is TRUE)

(<boolean> custom_animation_list <object_list> <animation_graph> <string> <boolean>)
; starts a custom animation playing on a unit list (interpolates into animation if last parameter is TRUE)

(<boolean> unit_is_playing_custom_animation <unit>)
; returns TRUE if the given unit is still playing a custom animation

(<void> unit_aim_without_turning <unit> <boolean>)
; allows a unit to aim in place without turning

(<void> unit_set_emotion <unit> <short>)
; sets a unit's facial expression (-1 is none, other values depend on unit)

(<void> unit_set_enterable_by_player <unit> <boolean>)
; can be used to prevent the player from entering a vehicle

(<void> unit_enter_vehicle <unit> <vehicle> <string>)
; puts the specified unit in the specified vehicle (in the named seat)

(<boolean> vehicle_test_seat_list <vehicle> <string> <object_list>)
; tests whether the named seat has an object in the object list

(<boolean> vehicle_test_seat <vehicle> <string> <unit>)
; tests whether the named seat has a specified unit in it

(<void> unit_set_emotion_animation <unit> <string>)
; sets the emotion animation to be used for the given unit

(<void> unit_exit_vehicle <unit>)
; makes a unit exit its vehicle

(<void> unit_set_maximum_vitality <unit> <real> <real>)
; sets a unit's maximum body and shield vitality

(<void> units_set_maximum_vitality <object_list> <real> <real>)
; sets a group of units' maximum body and shield vitality

(<void> unit_set_current_vitality <unit> <real> <real>)
; sets a unit's current body and shield vitality

(<void> units_set_current_vitality <object_list> <real> <real>)
; sets a group of units' current body and shield vitality

(<short> vehicle_load_magic <unit> <string> <object_list>)
; makes a list of units (named or by encounter) magically get into a vehicle, in the substring-specified seats (e.g. CD-passenger... empty string matches all seats)

(<short> vehicle_unload <unit> <string>)
; makes units get out of a vehicle from the substring-specified seats (e.g. CD-passenger... empty string matches all seats)

(<void> magic_seat_name <string>)
; all units controlled by the player will assume the given seat name (valid values are 'asleep', 'alert', 'stand', 'crouch' and 'flee')

(<void> unit_set_seat <unit> <string>)
; this unit will assume the named seat

(<void> magic_melee_attack)
; causes player's unit to start a melee attack

(<object_list> vehicle_riders <unit>)
; returns a list of all riders in a vehicle

(<unit> vehicle_driver <unit>)
; returns the driver of a vehicle

(<unit> vehicle_gunner <unit>)
; returns the gunner of a vehicle

(<real> unit_get_health <unit>)
; returns the health [0,1] of the unit, returns -1 if the unit does not exists

(<real> unit_get_shield <unit>)
; returns the shield [0,1] of the unit, returns -1 if the unit does not exists

(<short> unit_get_total_grenade_count <unit>)
; returns the total number of grenades for the given unit, 0 if it does not exist

(<boolean> unit_has_weapon <unit> <object_definition>)
; returns TRUE if the <unit> has <object> as a weapon, FALSE otherwise

(<boolean> unit_has_weapon_readied <unit> <object_definition>)
; returns TRUE if the <unit> has <object> as the primary weapon, FALSE otherwise

(<void> unit_doesnt_drop_items <object_list>)
; prevents any of the given units from dropping weapons or grenades when they die

(<void> unit_impervious <object_list> <boolean>)
; prevents any of the given units from being knocked around or playing ping animations

(<void> unit_suspended <unit> <boolean>)
; stops gravity from working on the given unit

(<boolean> unit_solo_player_integrated_night_vision_is_active)
; returns whether the night-vision mode could be activated via the flashlight button

(<void> units_set_desired_flashlight_state <object_list> <boolean>)
; sets the units' desired flashlight state

(<void> unit_set_desired_flashlight_state <unit> <boolean>)
; sets the unit's desired flashlight state

(<boolean> unit_get_current_flashlight_state <unit>)
; gets the unit's current flashlight state

(<void> device_set_never_appears_locked <device> <boolean>)
; changes a machine's never_appears_locked flag, but only if paul is a BLAM!

(<real> device_get_power <device>)
; gets the current power of a named device

(<void> device_set_power <device> <real>)
; immediately sets the power of a named device to the given value

(<boolean> device_set_position <device> <real>)
; set the desired position of the given device (used for devices without explicit device groups)

(<real> device_get_position <device>)
; gets the current position of the given device (used for devices without explicit device groups)

(<void> device_set_position_immediate <device> <real>)
; instantaneously changes the position of the given device (used for devices without explicit device groups

(<real> device_group_get <device_group>)
; returns the desired value of the specified device group.

(<boolean> device_group_set <device_group> <real>)
; changes the desired value of the specified device group.

(<void> device_group_set_immediate <device_group> <real>)
; instantaneously changes the value of the specified device group.

(<void> device_one_sided_set <device> <boolean>)
; TRUE makes the given device one-sided (only able to be opened from one direction), FALSE makes it two-sided

(<void> device_operates_automatically_set <device> <boolean>)
; TRUE makes the given device open automatically when any biped is nearby, FALSE makes it not

(<void> device_group_change_only_once_more_set <device_group> <boolean>)
; TRUE allows a device to change states only once

(<void> breakable_surfaces_reset)
; restores all breakable surfaces

(<void> cheat_all_powerups)
; drops all powerups near player

(<void> cheat_all_weapons)
; drops all weapons near player

(<void> cheat_give_some_gun)
; drops shotgun

(<void> cheat_all_chars)
; drops all vehicles on player

(<void> cheat_spawn_warthog)
; drops a warthog near player

(<void> cheat_all_vehicles)
; drops all vehicles on player

(<void> cheat_teleport_to_camera)
; teleports player to camera location

(<void> cheat_active_camouflage)
; gives the player active camouflage

(<void> cheat_active_camouflage_local_player <short>)
; gives the player active camouflage

(<void> cheats_load)
; reloads the cheats.txt file

(<void> ai_free <ai>)
; removes a group of actors from their encounter and sets them free

(<void> ai_free_units <object_list>)
; removes a set of units from their encounter (if any) and sets them free

(<void> ai_attach <unit> <ai>)
; attaches the specified unit to the specified encounter.

(<void> ai_attach_free <unit> <actor_variant>)
; attaches a unit to a newly created free actor of the specified type

(<void> ai_detach <unit>)
; detaches the specified unit from all AI.

(<void> ai_place <ai>)
; places the specified encounter on the map.

(<void> ai_kill <ai>)
; instantly kills the specified encounter and/or squad.

(<void> ai_kill_silent <ai>)
; instantly and silently (no animation or sound played) kills the specified encounter and/or squad.

(<void> ai_erase <ai>)
; erases the specified encounter and/or squad.

(<void> ai_erase_all)
; erases all AI.

(<void> ai_select <ai>)
; selects the specified encounter.

(<void> ai_spawn_actor <ai>)
; spawns a single actor in the specified encounter and/or squad.

(<void> ai_set_respawn <ai> <boolean>)
; enables or disables respawning in the specified encounter.

(<void> ai_set_deaf <ai> <boolean>)
; enables or disables hearing for actors in the specified encounter.

(<void> ai_set_blind <ai> <boolean>)
; enables or disables sight for actors in the specified encounter.

(<void> ai_magically_see_encounter <ai> <ai>)
; makes one encounter magically aware of another.

(<void> ai_magically_see_players <ai>)
; makes an encounter magically aware of nearby players.

(<void> ai_magically_see_unit <ai> <unit>)
; makes an encounter magically aware of the specified unit.

(<void> ai_timer_start <ai>)
; makes a squad's delay timer start counting.

(<void> ai_timer_expire <ai>)
; makes a squad's delay timer expire and releases them to enter combat.

(<void> ai_attack <ai>)
; makes the specified platoon(s) go into the attacking state.

(<void> ai_defend <ai>)
; makes the specified platoon(s) go into the defending state.

(<void> ai_retreat <ai>)
; makes all squads in the specified platoon(s) maneuver to their designated maneuver squads.

(<void> ai_maneuver <ai>)
; makes all squads in the specified platoon(s) maneuver to their designated maneuver squads.

(<void> ai_maneuver_enable <ai> <boolean>)
; enables or disables the maneuver/retreat rule for an encounter or platoon. the rule will still trigger, but none of the actors will be given the order to change squads.

(<void> ai_migrate <ai> <ai>)
; makes all or part of an encounter move to another encounter.

(<void> ai_migrate_and_speak <ai> <ai> <string>)
; makes all or part of an encounter move to another encounter, and say their 'advance' or 'retreat' speech lines.

(<void> ai_migrate_by_unit <object_list> <ai>)
; makes a named vehicle or group of units move to another encounter.

(<void> ai_allegiance <team> <team>)
; creates an allegiance between two teams.

(<void> ai_allegiance_remove <team> <team>)
; destroys an allegiance between two teams.

(<short> ai_living_count <ai>)
; return the number of living actors in the specified encounter and/or squad.

(<real> ai_living_fraction <ai>)
; return the fraction [0-1] of living actors in the specified encounter and/or squad.

(<real> ai_strength <ai>)
; return the current strength (average body vitality from 0-1) of the specified encounter and/or squad.

(<short> ai_swarm_count <ai>)
; return the number of swarm actors in the specified encounter and/or squad.

(<short> ai_nonswarm_count <ai>)
; return the number of non-swarm actors in the specified encounter and/or squad.

(<object_list> ai_actors <ai>)
; converts an ai reference to an object list.

(<void> ai_go_to_vehicle <ai> <unit> <string>)
; tells a group of actors to get into a vehicle, in the substring-specified seats (e.g. passenger for pelican)... does not interrupt any actors who are already going to vehicles

(<void> ai_go_to_vehicle_override <ai> <unit> <string>)
; tells a group of actors to get into a vehicle, in the substring-specified seats (e.g. passenger for pelican)... NB: any actors who are already going to vehicles will stop and go to this one instead!

(<short> ai_going_to_vehicle <unit>)
; return the number of actors that are still trying to get into the specified vehicle

(<void> ai_exit_vehicle <ai>)
; tells a group of actors to get out of any vehicles that they are in

(<void> ai_braindead <ai> <boolean>)
; makes a group of actors braindead, or restores them to life (in their initial state)

(<void> ai_braindead_by_unit <object_list> <boolean>)
; makes a list of objects braindead, or restores them to life. if you pass in a vehicle index, it makes all actors in that vehicle braindead (including any built-in guns)

(<void> ai_disregard <object_list> <boolean>)
; if TRUE, forces all actors to completely disregard the specified units, otherwise lets them acknowledge the units again

(<void> ai_prefer_target <object_list> <boolean>)
; if TRUE, *ALL* enemies will prefer to attack the specified units. if FALSE, removes the preference.

(<void> ai_teleport_to_starting_location <ai>)
; teleports a group of actors to the starting locations of their current squad(s)

(<void> ai_teleport_to_starting_location_if_unsupported <ai>)
; teleports a group of actors to the starting locations of their current squad(s), only if they are not supported by solid ground (i.e. if they are falling after switching BSPs)

(<void> ai_renew <ai>)
; refreshes the health and grenade count of a group of actors, so they are as good as new

(<void> ai_try_to_fight_nothing <ai>)
; removes the preferential target setting from a group of actors

(<void> ai_try_to_fight <ai> <ai>)
; causes a group of actors to preferentially target another group of actors

(<void> ai_try_to_fight_player <ai>)
; causes a group of actors to preferentially target the player

(<void> ai_command_list <ai> <ai_command_list>)
; tells a group of actors to begin executing the specified command list

(<void> ai_command_list_by_unit <unit> <ai_command_list>)
; tells a named unit to begin executing the specified command list

(<void> ai_command_list_advance <ai>)
; tells a group of actors that are running a command list that they may advance further along the list (if they are waiting for a stimulus)

(<void> ai_command_list_advance_by_unit <unit>)
; just like ai_command_list_advance but operates upon a unit instead

(<short> ai_command_list_status <object_list>)
; gets the status of a number of units running command lists: 0 = none, 1 = finished command list, 2 = waiting for stimulus, 3 = running command list

(<boolean> ai_is_attacking <ai>)
; returns whether a platoon is in the attacking mode (or if an encounter is specified, returns whether any platoon in that encounter is attacking)

(<void> ai_force_active <ai> <boolean>)
; forces an encounter to remain active (i.e. not freeze in place) even if there are no players nearby

(<void> ai_force_active_by_unit <unit> <boolean>)
; forces a named actor that is NOT in an encounter to remain active (i.e. not freeze in place) even if there are no players nearby

(<void> ai_set_return_state <ai> <ai_default_state>)
; sets the state that a group of actors will return to when they have nothing to do

(<void> ai_set_current_state <ai> <ai_default_state>)
; sets the current state of a group of actors. WARNING: may have unpredictable results on actors that are in combat

(<void> ai_playfight <ai> <boolean>)
; sets an encounter to be playfighting or not

(<short> ai_status <ai>)
; returns the most severe combat status of a group of actors (0=inactive, 1=noncombat, 2=guarding, 3=search/suspicious, 4=definite enemy(heard or magic awareness), 5=visible enemy, 6=engaging in combat.

(<void> ai_reconnect)
; reconnects all AI information to the current structure bsp (use this after you create encounters or command lists in sapien, or place new firing points or command list points)

(<void> ai_vehicle_encounter <unit> <ai>)
; sets a vehicle to 'belong' to a particular encounter/squad. any actors who get into the vehicle will be placed in this squad. NB: vehicles potentially drivable by multiple teams need their own encounter!

(<void> ai_vehicle_enterable_distance <unit> <real>)
; sets a vehicle as being impulsively enterable for actors within a certain distance

(<void> ai_vehicle_enterable_team <unit> <team>)
; sets a vehicle as being impulsively enterable for actors on a certain team

(<void> ai_vehicle_enterable_actor_type <unit> <actor_type>)
; sets a vehicle as being impulsively enterable for actors of a certain type (grunt, elite, marine etc)

(<void> ai_vehicle_enterable_actors <unit> <ai>)
; sets a vehicle as being impulsively enterable for a certain encounter/squad of actors

(<void> ai_vehicle_enterable_disable <unit>)
; disables actors from impulsively getting into a vehicle (this is the default state for newly placed vehicles)

(<void> ai_look_at_object <unit> <object>)
; tells an actor to look at an object until further notice

(<void> ai_stop_looking <unit>)
; tells an actor to stop looking at whatever it's looking at

(<void> ai_automatic_migration_target <ai> <boolean>)
; enables or disables a squad as being an automatic migration target

(<void> ai_follow_target_disable <ai>)
; turns off following for an encounter

(<void> ai_follow_target_players <ai>)
; sets the follow target for an encounter to be the closest player

(<void> ai_follow_target_unit <ai> <unit>)
; sets the follow target for an encounter to be a specific unit

(<void> ai_follow_target_ai <ai> <ai>)
; sets the follow target for an encounter to be a group of AI (encounter, squad or platoon)

(<void> ai_follow_distance <ai> <real>)
; sets the distance threshold which will cause squads to migrate when following someone

(<boolean> ai_conversation <conversation>)
; tries to add an entry to the list of conversations waiting to play. returns FALSE if the required units could not be found to play the conversation, or if the player is too far away and the 'delay' flag is not set.

(<void> ai_conversation_stop <conversation>)
; stops a conversation from playing or trying to play

(<void> ai_conversation_advance <conversation>)
; tells a conversation that it may advance

(<short> ai_conversation_line <conversation>)
; returns which line the conversation is currently playing, or 999 if the conversation is not currently playing

(<short> ai_conversation_status <conversation>)
; returns the status of a conversation (0=none, 1=trying to begin, 2=waiting for guys to get in position, 3=playing, 4=waiting to advance, 5=could not begin, 6=finished successfully, 7=aborted midway

(<void> ai_link_activation <ai> <ai>)
; links the first encounter so that it will be made active whenever it detects that the second encounter is active

(<void> ai_berserk <ai> <boolean>)
; forces a group of actors to start or stop berserking

(<void> ai_set_team <ai> <team>)
; makes an encounter change to a new team

(<void> ai_allow_charge <ai> <boolean>)
; either enables or disables charging behavior for a group of actors

(<void> ai_allow_dormant <ai> <boolean>)
; either enables or disables automatic dormancy for a group of actors

(<boolean> ai_allegiance_broken <team> <team>)
; returns whether two teams have an allegiance that is currently broken by traitorous behavior

(<void> camera_control <boolean>)
; toggles script control of the camera.

(<void> camera_set <cutscene_camera_point> <short>)
; moves the camera to the specified camera point over the specified number of ticks.

(<void> camera_set_relative <cutscene_camera_point> <short> <object>)
; moves the camera to the specified camera point over the specified number of ticks (position is relative to the specified object).

(<void> camera_set_animation <animation_graph> <string>)
; begins a prerecorded camera animation.

(<void> camera_set_first_person <unit>)
; makes the scripted camera follow a unit.

(<void> camera_set_dead <unit>)
; makes the scripted camera zoom out around a unit as if it were dead.

(<short> camera_time)
; returns the number of ticks remaining in the current camera interpolation.

(<void> debug_camera_load)
; loads the saved camera position and facing from camera_<map_name>.txt

(<void> debug_camera_save)
; saves the camera position and facing to camera_<map_name>.txt

(<void> debug_camera_save_name <string>)
; saves the camera position and facing to <name>_<map_name>.txt

(<void> debug_camera_load_name <string>)
; loads the camera position and facing from <name>_<map_name>.txt

(<void> debug_camera_save_simple_name <string>)
; saves the camera position and facing to camera_<name>.txt

(<void> debug_camera_load_simple_name <string>)
; loads the camera position and facing from camera_<name>.txt

(<void> debug_camera_load_text <string>)
; loads the camera position and facing from a passed in string

(<void> game_speed <real>)
; changes the game speed.

(<long> game_time)
; gets ticks elapsed since the start of the game.

(<long> game_time_authoritative)
; gets ticks elapsed since the start of the game (relative to the sim authority).

(<void> game_variant <string>)
; set the game engine

(<game_difficulty> game_difficulty_get)
; returns the current difficulty setting, but lies to you and will never return easy, instead returning normal

(<game_difficulty> game_difficulty_get_real)
; returns the actual current difficulty setting without lying

(<void> map_reset)
; starts the map from the beginning.

(<void> map_name <string>)
; changes the name of the solo player map.

(<void> multiplayer_map_name <string>)
; changes the name of the multiplayer map

(<void> game_difficulty_set <game_difficulty>)
; changes the difficulty setting for the next map to be loaded.

(<void> crash <string>)
; crashes (for debugging).

(<void> switch_bsp <short>)
; takes off your condom and changes to a different structure bsp

(<short> structure_bsp_index)
; returns the current structure bsp index

(<void> version)
; prints the build version.

(<void> playback)
; starts game in film playback mode

(<void> quit)
; quits the game

(<void> screenshot_cubemap <string>)
; takes a cubemap screenshot and saves as <name>.tif

(<void> sound_cache_flush)
; i'm a rebel!

(<void> sound_cache_dump_to_file)
; dump dat stuff!

(<void> debug_pvs <boolean>)
; displays the current pvs.

(<void> radiosity_start)
; starts radiosity computation.

(<void> radiosity_save)
; saves radiosity solution.

(<void> radiosity_debug_point)
; tests sun occlusion at a point.

(<void> ai <boolean>)
; turns all AI on or off.

(<void> ai_dialogue_triggers <boolean>)
; turns impromptu dialogue on or off.

(<void> ai_grenades <boolean>)
; turns grenade inventory on or off.

(<void> fade_in <real> <real> <real> <short>)
; does a screen fade in from a particular color

(<void> fade_out <real> <real> <real> <short>)
; does a screen fade out to a particular color

(<void> cinematic_start)
; initializes game to start a cinematic (interruptive) cutscene

(<void> cinematic_stop)
; initializes the game to end a cinematic (interruptive) cutscene

(<void> cinematic_abort)
; aborts a cinematic

(<void> cinematic_skip_start_internal)

(<void> cinematic_skip_stop_internal)

(<void> cinematic_show_letterbox <boolean>)
; sets or removes the letterbox bars

(<void> cinematic_set_title <cutscene_title>)
; activates the chapter title

(<void> cinematic_set_title_delayed <cutscene_title> <real>)
; activates the chapter title, delayed by <real> seconds

(<void> cinematic_suppress_bsp_object_creation <boolean>)
; suppresses or enables the automatic creation of objects during cutscenes due to a bsp switch

(<void> game_won)
; causes the player to successfully finish the current level and move to the next

(<void> game_lost)
; causes the player to revert to their previous saved game

(<boolean> game_safe_to_save)
; returns FALSE if it would be a bad idea to save the player's game right now

(<boolean> game_all_quiet)
; returns FALSE if there are bad guys around, projectiles in the air, etc.

(<boolean> game_safe_to_speak)
; returns FALSE if it would be a bad idea to save the player's game right now

(<boolean> game_is_cooperative)
; returns TRUE if the game is cooperative

(<boolean> game_is_authoritative)

(<void> game_save)
; checks to see if it is safe to save game, then saves (gives up after 8 seconds)

(<void> game_save_cancel)
; cancels any pending game_save, timeout or not

(<void> game_save_no_timeout)
; checks to see if it is safe to save game, then saves (this version never gives up)

(<void> game_save_totally_unsafe)
; disregards player's current situation

(<boolean> game_saving)
; checks to see if the game is trying to save the map.

(<void> game_revert)
; reverts to last saved game, if any (for testing, the first bastard that does this to me gets it in the head)

(<boolean> game_reverted)
; don't use this for anything, you black-hearted bastards.

(<void> core_save)
; saves debug game state to core\core.bin

(<boolean> core_save_name <string>)
; saves debug game state to core\<path>

(<void> core_load)
; loads debug game state from core\core.bin

(<void> core_load_at_startup)
; loads debug game state from core\core.bin as soon as the map is initialized

(<void> core_load_name <string>)
; loads debug game state from core\<path>

(<void> core_load_name_at_startup <string>)
; loads debug game state from core\<path> as soon as the map is initialized

(<boolean> mcc_mission_segment <string>)

(<void> game_skip_ticks <short>)
; skips <short> amount of game ticks. ONLY USE IN CUTSCENES!!!

(<void> sound_impulse_predict <sound> <boolean>)
; loads an impulse sound into the sound cache ready for playback.

(<void> sound_impulse_start <sound> <object> <real>)
; plays an impulse sound from the specified source object (or "none"), with the specified scale.

(<long> sound_impulse_time <sound>)
; returns the time remaining for the specified impulse sound.

(<void> sound_impulse_stop <sound>)
; stops the specified impulse sound.

(<void> sound_looping_predict <looping_sound>)
; your mom.

(<void> sound_looping_start <looping_sound> <object> <real>)
; plays a looping sound from the specified source object (or "none"), with the specified scale.

(<void> sound_looping_stop <looping_sound>)
; stops the specified looping sound.

(<void> sound_looping_set_scale <looping_sound> <real>)
; changes the scale of the sound (which should affect the volume) within the range 0 to 1.

(<void> sound_looping_set_alternate <looping_sound> <boolean>)
; enables or disables the alternate loop/alternate end for a looping sound.

(<void> debug_sounds_enable <string> <boolean>)
; enables or disabled all sound classes matching the substring.

(<void> sound_enable <boolean>)
; enables or disables all sound.

(<void> sound_set_master_gain <real>)
; Set the game's master gain

(<real> sound_get_master_gain)
; Returns the game's master gain

(<void> sound_set_music_gain <real>)
; Set the game's music gain

(<real> sound_get_music_gain)
; Returns the game's music gain

(<void> sound_set_effects_gain <real>)
; Set the game's effects gain

(<real> sound_get_effects_gain)
; Returns the game's effects gain

(<void> sound_class_set_gain <string> <real> <short>)
; changes the gain on the specified sound class(es) to the specified game over the specified number of ticks.

(<void> vehicle_hover <vehicle> <boolean>)
; stops the vehicle from running real physics and runs fake hovering physics instead.

(<void> players_unzoom_all)
; resets zoom levels on all players

(<void> player_enable_input <boolean>)
; toggle player input. the player can still free-look, but nothing else.

(<boolean> player_camera_control <boolean>)
; enables/disables camera control globally

(<void> player_action_test_reset)
; resets the player action test state so that all tests will return false.

(<boolean> player_action_test_jump)
; returns true if any player has jumped since the last call to (player_action_test_reset).

(<boolean> player_action_test_primary_trigger)
; returns true if any player has used primary trigger since the last call to (player_action_test_reset).

(<boolean> player_action_test_grenade_trigger)
; returns true if any player has used grenade trigger since the last call to (player_action_test_reset).

(<boolean> player_action_test_zoom)
; returns true if any player has hit the zoom button since the last call to (player_action_test_reset).

(<boolean> player_action_test_action)
; returns true if any player has hit the action key since the last call to (player_action_test_reset).

(<boolean> player_action_test_accept)
; returns true if any player has hit accept since the last call to (player_action_test_reset).

(<boolean> player_action_test_back)
; returns true if any player has hit the back key since the last call to (player_action_test_reset).

(<boolean> player_action_test_look_relative_up)
; returns true if any player has looked up since the last call to (player_action_test_reset).

(<boolean> player_action_test_look_relative_down)
; returns true if any player has looked down since the last call to (player_action_test_reset).

(<boolean> player_action_test_look_relative_left)
; returns true if any player has looked left since the last call to (player_action_test_reset).

(<boolean> player_action_test_look_relative_right)
; returns true if any player has looked right since the last call to (player_action_test_reset).

(<boolean> player_action_test_look_relative_all_directions)
; returns true if any player has looked up, down, left, and right since the last call to (player_action_test_reset).

(<boolean> player_action_test_move_relative_all_directions)
; returns true if any player has moved forward, backward, left, and right since the last call to (player_action_test_reset).

(<void> player_add_equipment <unit> <starting_profile> <boolean>)
; adds/resets the player's health, shield, and inventory (weapons and grenades) to the named profile. resets if third parameter is true, adds if false.

(<void> debug_teleport_player <short> <short>)

(<boolean> show_hud <boolean>)
; shows or hides the hud

(<boolean> show_hud_help_text <boolean>)
; shows or hides the hud help text

(<void> enable_hud_help_flash <boolean>)
; starts/stops the help text flashing

(<void> hud_help_flash_restart)
; resets the timer for the help text flashing

(<void> activate_nav_point_flag <navpoint> <unit> <cutscene_flag> <real>)
; activates a nav point type <string> attached to (local) player <unit> anchored to a flag with a vertical offset <real>. If the player is not local to the machine, this will fail

(<void> activate_nav_point_object <navpoint> <unit> <object> <real>)
; activates a nav point type <string> attached to (local) player <unit> anchored to an object with a vertical offset <real>. If the player is not local to the machine, this will fail

(<void> activate_team_nav_point_flag <navpoint> <team> <cutscene_flag> <real>)
; activates a nav point type <string> attached to a team anchored to a flag with a vertical offset <real>. If the player is not local to the machine, this will fail

(<void> activate_team_nav_point_object <navpoint> <team> <object> <real>)
; activates a nav point type <string> attached to a team anchored to an object with a vertical offset <real>. If the player is not local to the machine, this will fail

(<void> breadcrumbs_activate_team_nav_point_position <navpoint> <team> <real> <real> <real> <string> <real>)
; activates a nav point type <string> attached to a team anchored to position xyz <real, real, real> named <_hs_type_string> and with a vertical offset <real>. If the player is not local to the machine or the improved navpoints setting is disabled, this will fail

(<void> breadcrumbs_activate_team_nav_point_flag <navpoint> <team> <cutscene_flag> <real>)
; activates a nav point type <string> attached to a team anchored to a flag with a vertical offset <real>. If the player is not local to the machine or the improved navpoints setting is disabled, this will fail

(<void> breadcrumbs_activate_team_nav_point_object <navpoint> <team> <object> <real>)
; activates a nav point type <string> attached to a team anchored to an object with a vertical offset <real>. If the player is not local to the machine or the improved navpoints setting is disabled, this will fail

(<void> deactivate_nav_point_flag <unit> <cutscene_flag>)
; deactivates a nav point type attached to a player <unit> anchored to a flag

(<void> deactivate_nav_point_object <unit> <object>)
; deactivates a nav point type attached to a player <unit> anchored to an object

(<void> deactivate_team_nav_point_flag <team> <cutscene_flag>)
; deactivates a nav point type attached to a team anchored to a flag

(<void> deactivate_team_nav_point_object <team> <object>)
; deactivates a nav point type attached to a team anchored to an object

(<void> breadcrumbs_deactivate_team_nav_point <team> <string>)
; deactivates a nav point type attached to a team of name <_hs_type_string>

(<void> breadcrumbs_deactivate_team_nav_point_flag <team> <cutscene_flag>)
; deactivates a nav point type attached to a team anchored to a flag

(<void> breadcrumbs_deactivate_team_nav_point_object <team> <object>)
; deactivates a nav point type attached to a team anchored to an object

(<boolean> breadcrumbs_nav_points_active)
; returns true if breadcrumbs improved nav points are enabled

(<void> cls)
; clears console text from the screen

(<void> error_overflow_suppression <boolean>)
; enables or disables the suppression of error spamming

(<void> player_effect_set_max_translation <real> <real> <real>)
; <x> <y> <z>

(<void> player_effect_set_max_rotation <real> <real> <real>)
; <yaw> <pitch> <roll>

(<void> player_effect_set_max_vibrate <real> <real>)
; <left> <right>

(<void> player_effect_set_max_rumble <real> <real>)
; DEPRECATED: Use player_effect_set_max_vibrate, this is only to keep compatibility with Custom Edition

(<void> player_effect_start <real> <real>)
; <max_intensity> <attack time>

(<void> player_effect_stop <real>)
; <decay>

(<void> hud_show_health <boolean>)
; hides/shows the health panel

(<void> hud_blink_health <boolean>)
; starts/stops manual blinking of the health panel

(<void> hud_show_shield <boolean>)
; hides/shows the shield panel

(<void> hud_blink_shield <boolean>)
; starts/stops manual blinking of the shield panel

(<void> hud_show_motion_sensor <boolean>)
; hides/shows the motion sensor panel

(<void> hud_blink_motion_sensor <boolean>)
; starts/stops manual blinking of the motion sensor panel

(<void> hud_show_crosshair <boolean>)
; hides/shows the weapon crosshair

(<void> hud_clear_messages)
; clears all non-state messages on the hud

(<void> hud_set_help_text <hud_message>)
; displays <message> as the help text

(<void> hud_set_objective_text <hud_message>)
; sets <message> as the current objective

(<void> hud_set_timer_time <short> <short>)
; sets the time for the timer to <short> minutes and <short> seconds, and starts and displays timer

(<void> hud_set_timer_warning_time <short> <short>)
; sets the warning time for the timer to <short> minutes and <short> seconds

(<void> hud_set_timer_position <short> <short> <hud_corner>)
; sets the timer upper left position to (x, y)=>(<short>, <short>)

(<void> show_hud_timer <boolean>)
; displays the hud timer

(<void> pause_hud_timer <boolean>)
; pauses or unpauses the hud timer

(<short> hud_get_timer_ticks)
; returns the ticks left on the hud timer

(<void> time_code_show <boolean>)
; shows the time code timer

(<void> time_code_start <boolean>)
; starts/stops the time code timer

(<void> time_code_reset)
; resets the time code timer

(<void> reload_shader_transparent_chicago)

(<void> rasterizer_reload_effects)
; check for shader changes

(<void> rasterizer_decals_flush)
; flush all decals

(<void> rasterizer_fps_accumulate)
; average fps

(<void> rasterizer_model_ambient_reflection_tint <real> <real> <real> <real>)

(<void> rasterizer_lights_reset_for_new_map)

(<void> script_screen_effect_set_value <short> <real>)
; sets a screen effect script value

(<void> cinematic_screen_effect_start <boolean>)
; starts screen effect; pass TRUE to clear

(<void> cinematic_screen_effect_set_convolution <short> <short> <real> <real> <real>)
; sets the convolution effect

(<void> cinematic_screen_effect_set_filter <real> <real> <real> <real> <boolean> <real>)
; sets the filter effect

(<void> cinematic_screen_effect_set_filter_desaturation_tint <real> <real> <real>)
; sets the desaturation filter tint color

(<void> cinematic_screen_effect_set_video <short> <real>)
; sets the video effect: <noise intensity[0,1]>, <overbright: 0=none, 1=2x, 2=4x>

(<void> cinematic_screen_effect_stop)
; returns control of the screen effects to the rest of the game

(<void> cinematic_set_near_clip_distance <real>)

(<void> player0_look_invert_pitch <boolean>)
; invert player0's look

(<boolean> player0_look_pitch_is_inverted)
; returns TRUE if player0's look pitch is inverted

(<boolean> player0_joystick_set_is_normal)
; returns TRUE if player0 is using the normal joystick set

(<void> ui_widget_show_path <boolean>)
; blah blah

(<void> display_scenario_help <short>)
; display in-game help dialog

(<void> sound_enable_eax <boolean>)
; Enable or disable EAX extensions

(<boolean> sound_eax_enabled)
; Returns true if EAX extensions are enabled

(<void> sound_set_env <short>)
; Change environment preset

(<void> sound_enable_hardware <boolean> <boolean>)
; Enable or disable hardware sound buffers

(<void> sound_set_supplementary_buffers <short> <boolean>)
; Set the amount of supplementary buffers

(<short> sound_get_supplementary_buffers)
; Get the amount of supplementary buffers

(<void> sound_set_rolloff <real>)
; Set the DSound rolloff value

(<void> sound_set_factor <real>)
; Set the DSound factor value

(<real> get_yaw_rate <short>)
; gets the yaw rate for the given player number

(<real> get_pitch_rate <short>)
; gets the yaw rate for the given player number

(<void> set_yaw_rate <short> <real>)
; sets the yaw rate for the given player number

(<void> set_pitch_rate <short> <real>)
; sets the yaw rate for the given player number

(<void> bind <string> <string> <string>)
; binds an input device/button combination to a game control

(<void> unbind <string> <string>)
; unbinds an input device/button combination

(<void> print_binds)
; prints a list of all input bindings

(<void> sv_map <string> <string>)

(<void> profile_load <string>)
; Load any included builtin profiles and create profiles on disk.

(<void> checkpoint_load <string>)
; load a saved checkpoint

(<void> TestPrintBool <string> <boolean>)
; Prints the specified boolean with the format '<string> = '<boolean>' to the Shell.

(<void> TestPrintReal <string> <real>)
; Prints the specified real with the format '<string> = '<real>' to the Shell.

(<void> structure_lens_flares_place)
; places lens flares in the structure bsp

(<void> events_enabled <boolean>)
; enable/disable all events
; NETWORK SAFE: No

(<void> events_disable_suppression <boolean>)
; enable/disable event suppression
; NETWORK SAFE: No

(<void> event_global_display_category <string>)
; sets the global event display level
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_global_log_category <string>)
; sets the global evetn log level
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_global_remote_log_category <string>)
; sets the global remote evetn log level
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_display_category <string> <string>)
; sets the display level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_force_display_category <string> <string>)
; sets the forced display level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_log_category <string> <string>)
; sets the log level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_remote_log_category <string> <string>)
; sets the remote log level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_debugger_break_category <string> <string>)
; sets the debugger break level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_halt_category <string> <string>)
; sets the halt (assert/crash) level for a named category of network events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> event_list_categories <string>)
; lists all categories that exist under a particular category string
; NETWORK SAFE: Unknown, assumed unsafe

(<void> events_suppress_console_display <boolean>)
; disables console display for events
; NETWORK SAFE: Unknown, assumed unsafe

(<void> saved_film_play <short> <string>)
; plays a saved film for given controller
; NETWORK SAFE: Unknown, assumed unsafe

(<void> saved_film_disable_version_checking <boolean>)
; disable saved film version checking
; NETWORK SAFE: Unknown, assumed unsafe

(<void> saved_film_toggle_debug_saving <boolean>)
; toggle saving of last film to the debug output directory automatically after each game level
; NETWORK SAFE: Unknown, assumed unsafe

(<void> saved_films_delete_on_level_load <boolean>)
; toggle deletion last saved film after loading a new game level
; NETWORK SAFE: Unkown, assumed unsafe

(<void> saved_films_show_timestamp <boolean>)
; toggle showing timestamp for saved film playback
; NETWORK SAFE: Unkown, assumed unsafe

(<void> saved_film_set_playback_game_speed <real>)
; set the saved film playback speed

(<void> saved_film_seek_to_film_tick <long>)
; seeks to a film tick

(<void> saved_film_set_repro_mode <boolean>)
; set the saved film into repro mode (splitscreen users are created based on the number of splitscreen players that recorded the film)

(<void> determinism_debug_manager_enable_logging <boolean>)
; enable/disable determinism logging
; NETWORK SAFE: Unknown, assumed unsafe

(<void> determinism_debug_manager_set_trace_flags <long>)
; set which determinism debugging traces should be turned on
; NETWORK SAFE: Unknown, assumed unsafe

(<void> determinism_debug_manager_enable_game_state_checksum <boolean>)
; enable/disable determinism checkpoints
; NETWORK SAFE: Unknown, assumed unsafe

(<void> determinism_debug_manager_enable_trace <boolean>)
; enable determinism tracing
; NETWORK SAFE: Unknown, assumed unsafe

(<void> determinism_debug_manager_set_consumer_sample_level <string> <long>)
; sets sample level for a consumer
; NETWORK SAFE: Unknown, assumed unsafe

(<void> determinism_debug_manager_enable_log_file_comparision_on_oos <boolean>)
; enables/disables determinism log file comparision on oos
; NETWORK SAFE: No

(<void> determinism_log_compare_log_files <string> <string>)
; compares determinism log files
; NETWORK SAFE: No

(<void> debug_menu_rebuild)
; Reparses the debug menu from the text file.

(<void> net_never_timeout <boolean>)
; 
; NETWORK SAFE: Unknown, assumed unsafe

; AVAILABLE EXTERNAL GLOBALS:

(<real> rasterizer_near_clip_distance)

(<real> rasterizer_far_clip_distance)

(<real> rasterizer_first_person_weapon_near_clip_distance)

(<real> rasterizer_first_person_weapon_far_clip_distance)

(<boolean> rasterizer_floating_point_zbuffer)

(<boolean> rasterizer_framerate_throttle)

(<boolean> rasterizer_framerate_stabilization)

(<short> rasterizer_refresh_rate)

(<short> rasterizer_frame_bounds_left)

(<short> rasterizer_frame_bounds_right)

(<short> rasterizer_frame_bounds_top)

(<short> rasterizer_frame_bounds_bottom)

(<short> rasterizer_stats)

(<short> rasterizer_mode)

(<boolean> rasterizer_wireframe)

(<boolean> rasterizer_smart)

(<boolean> rasterizer_debug_model_vertices)

(<short> rasterizer_debug_model_lod)

(<boolean> rasterizer_debug_transparents)

(<boolean> rasterizer_debug_meter_shader)

(<boolean> rasterizer_models)

(<boolean> rasterizer_model_transparents)

(<boolean> rasterizer_draw_first_person_weapon_first)

(<boolean> rasterizer_stencil_mask)

(<boolean> rasterizer_environment)

(<boolean> rasterizer_environment_lightmaps)

(<boolean> rasterizer_environment_shadows)

(<boolean> rasterizer_environment_diffuse_lights)

(<boolean> rasterizer_environment_diffuse_textures)

(<boolean> rasterizer_environment_decals)

(<boolean> rasterizer_environment_specular_lights)

(<boolean> rasterizer_environment_specular_lightmaps)

(<boolean> rasterizer_environment_reflection_lightmap_mask)

(<boolean> rasterizer_environment_reflection_mirrors)

(<boolean> rasterizer_environment_reflections)

(<boolean> rasterizer_environment_transparents)

(<boolean> rasterizer_environment_fog)

(<boolean> rasterizer_environment_fog_screen)

(<boolean> rasterizer_water)

(<boolean> rasterizer_lens_flares)

(<boolean> rasterizer_dynamic_unlit_geometry)

(<boolean> rasterizer_dynamic_lit_geometry)

(<boolean> rasterizer_dynamic_screen_geometry)

(<boolean> rasterizer_hud_motion_sensor)

(<boolean> rasterizer_detail_objects)

(<boolean> rasterizer_debug_geometry)

(<boolean> rasterizer_debug_geometry_multipass)

(<boolean> rasterizer_fog_atmosphere)

(<boolean> rasterizer_fog_plane)

(<boolean> rasterizer_bump_mapping)

(<real> rasterizer_lightmap_ambient)

(<short> rasterizer_lightmap_mode)

(<boolean> rasterizer_lightmaps_incident_radiosity)

(<boolean> rasterizer_lightmaps_filtering)

(<real> rasterizer_model_lighting_ambient)

(<boolean> rasterizer_environment_alpha_testing)

(<boolean> rasterizer_environment_specular_mask)

(<boolean> rasterizer_shadows_convolution)

(<boolean> rasterizer_shadows_debug)

(<boolean> rasterizer_debug_shader_transparent_generic)

(<boolean> rasterizer_active_camouflage)

(<boolean> rasterizer_active_camouflage_multipass)

(<boolean> rasterizer_plasma_energy)

(<boolean> rasterizer_lens_flares_occlusion)

(<boolean> rasterizer_lens_flares_occlusion_debug)

(<boolean> rasterizer_ray_of_buddha)

(<boolean> rasterizer_screen_flashes)

(<boolean> rasterizer_screen_effects)

(<boolean> rasterizer_profile_log)

(<real> rasterizer_detail_objects_offset_multiplier)

(<real> rasterizer_zbias)

(<real> rasterizer_zoffset)

(<boolean> force_all_player_views_to_default_player)

(<boolean> rasterizer_safe_frame_bounds)

(<short> freeze_flying_camera)

(<boolean> rasterizer_zsprites)

(<boolean> rasterizer_filthy_decal_fog_hack)

(<short> pad3)

(<real> pad3_scale)

(<real> f0)

(<real> f1)

(<real> f2)

(<real> f3)

(<real> f4)

(<real> f5)

(<short> rasterizer_effects_level)

(<boolean> rasterizer_fps)

(<boolean> debug_no_frustum_clip)

(<boolean> debug_frustum)

(<short> screenshot_size)

(<short> screenshot_count)

(<boolean> terminal_render)

(<short> player_spawn_count)

(<boolean> debug_object_garbage_collection)

(<boolean> debug_render_freeze)

(<boolean> temporary_hud)

(<boolean> breadcrumbs_navpoints_enabled_override)

(<long> debug_leaf_index)

(<long> debug_leaf_portal_index)

(<boolean> debug_leaf_portals)

(<boolean> debug_unit_animations)

(<boolean> debug_damage_taken)

(<boolean> cheat_deathless_player)

(<boolean> cheat_jetpack)

(<boolean> cheat_infinite_ammo)

(<boolean> cheat_bottomless_clip)

(<boolean> cheat_bump_possession)

(<boolean> cheat_super_jump)

(<boolean> cheat_reflexive_damage_effects)

(<boolean> cheat_medusa)

(<boolean> cheat_omnipotent)

(<boolean> cheat_controller)

(<boolean> effects_corpse_nonviolent)

(<boolean> debug_sound_cache)

(<boolean> debug_sound_cache_graph)

(<real> sound_obstruction_ratio)

(<boolean> debug_sound)

(<boolean> debug_looping_sound)

(<boolean> debug_sound_channels)

(<boolean> debug_sound_channels_detail)

(<boolean> debug_sound_hardware)

(<boolean> loud_dialog_hack)

(<real> sound_gain_under_dialog)

(<real> object_light_ambient_base)

(<real> object_light_ambient_scale)

(<real> object_light_secondary_scale)

(<boolean> object_light_interpolate)

(<boolean> model_animation_compression)

(<long> model_animation_data_compressed_size)

(<long> model_animation_data_uncompressed_size)

(<long> model_animation_data_compression_savings_in_bytes)

(<long> model_animation_data_compression_savings_in_bytes_at_import)

(<real> model_animation_data_compression_savings_in_percent)

(<long> model_animation_bullshit0)

(<long> model_animation_bullshit1)

(<long> model_animation_bullshit2)

(<long> model_animation_bullshit3)

(<boolean> rider_ejection)

(<boolean> stun_enable)

(<boolean> debug_sprites)

(<boolean> debug_portals)

(<boolean> debug_inactive_objects)

(<boolean> debug_objects)

(<boolean> debug_objects_position_velocity)

(<boolean> debug_objects_root_node)

(<boolean> debug_objects_bounding_spheres)

(<boolean> debug_objects_collision_models)

(<boolean> debug_objects_physics)

(<boolean> debug_objects_names)

(<boolean> debug_objects_pathfinding_spheres)

(<boolean> debug_objects_unit_vectors)

(<boolean> debug_objects_unit_seats)

(<boolean> debug_objects_unit_mouth_apeture)

(<boolean> debug_objects_biped_physics_pills)

(<boolean> debug_objects_biped_autoaim_pills)

(<boolean> debug_objects_vehicle_powered_mass_points)

(<boolean> debug_objects_devices)

(<boolean> render_model_nodes)

(<boolean> render_model_vertex_counts)

(<boolean> render_model_index_counts)

(<boolean> render_model_markers)

(<boolean> render_model_no_geometry)

(<boolean> render_shadows)

(<boolean> debug_damage)

(<boolean> debug_scripting)

(<boolean> hs_verbose)

(<boolean> breakpoints_enabled)

(<boolean> debug_trigger_volumes)

(<boolean> debug_point_physics)

(<boolean> debug_physics_disable_penetration_freeze)

(<boolean> debug_motion_sensor_draw_all_units)

(<boolean> collision_debug)

(<boolean> collision_debug_spray)

(<boolean> collision_debug_features)

(<boolean> collision_debug_repeat)

(<boolean> collision_debug_flag_front_facing_surfaces)

(<boolean> collision_debug_flag_back_facing_surfaces)

(<boolean> collision_debug_flag_ignore_two_sided_surfaces)

(<boolean> collision_debug_flag_ignore_invisible_surfaces)

(<boolean> collision_debug_flag_ignore_breakable_surfaces)

(<boolean> collision_debug_flag_structure)

(<boolean> collision_debug_flag_media)

(<boolean> collision_debug_flag_objects)

(<boolean> collision_debug_flag_objects_bipeds)

(<boolean> collision_debug_flag_objects_vehicles)

(<boolean> collision_debug_flag_objects_weapons)

(<boolean> collision_debug_flag_objects_equipment)

(<boolean> collision_debug_flag_objects_projectiles)

(<boolean> collision_debug_flag_objects_scenery)

(<boolean> collision_debug_flag_objects_machines)

(<boolean> collision_debug_flag_objects_controls)

(<boolean> collision_debug_flag_objects_light_fixtures)

(<boolean> collision_debug_flag_objects_placeholders)

(<boolean> collision_debug_flag_try_to_keep_location_valid)

(<boolean> collision_debug_flag_skip_passthrough_bipeds)

(<boolean> collision_debug_flag_use_vehicle_physics)

(<real> collision_debug_point_x)

(<real> collision_debug_point_y)

(<real> collision_debug_point_z)

(<real> collision_debug_vector_i)

(<real> collision_debug_vector_j)

(<real> collision_debug_vector_k)

(<real> collision_debug_length)

(<real> collision_debug_width)

(<real> collision_debug_height)

(<boolean> collision_debug_phantom_bsp)

(<boolean> debug_obstacle_path)

(<boolean> debug_obstacle_path_on_failure)

(<real> debug_obstacle_path_start_point_x)

(<real> debug_obstacle_path_start_point_y)

(<long> debug_obstacle_path_start_surface_index)

(<real> debug_obstacle_path_goal_point_x)

(<real> debug_obstacle_path_goal_point_y)

(<long> debug_obstacle_path_goal_surface_index)

(<boolean> debug_camera)

(<boolean> debug_player)

(<boolean> debug_structure)

(<boolean> debug_structure_automatic)

(<boolean> debug_bsp)

(<boolean> debug_input)

(<boolean> debug_permanent_decals)

(<boolean> debug_fog_planes)

(<boolean> decals)

(<boolean> debug_decals)

(<boolean> debug_object_lights)

(<boolean> debug_lights)

(<boolean> debug_biped_physics)

(<boolean> debug_biped_skip_update)

(<boolean> debug_biped_skip_collision)

(<boolean> debug_biped_limp_body_disable)

(<boolean> debug_collision_skip_objects)

(<boolean> debug_collision_skip_vectors)

(<boolean> debug_material_effects)

(<boolean> weather)

(<boolean> breakable_surfaces)

(<boolean> decals)

(<boolean> recover_saved_games_hack)

(<short> radiosity_quality)

(<short> radiosity_step_count)

(<boolean> radiosity_lines)

(<boolean> radiosity_normals)

(<boolean> structures_use_pvs_for_vs)

(<boolean> debug_detail_objects)

(<boolean> controls_enable_crouch)

(<boolean> controls_swapped)

(<boolean> controls_enable_doubled_spin)

(<boolean> controls_swap_doubled_spin_state)

(<boolean> player_autoaim)

(<boolean> player_magnetism)

(<boolean> debug_player_teleport)

(<boolean> director_camera_switch_fast)

(<boolean> director_camera_switching)

(<boolean> debug_framerate)

(<boolean> display_framerate)

(<boolean> framerate_throttle)

(<boolean> framerate_lock)

(<boolean> debug_game_save)

(<boolean> allow_out_of_sync)

(<boolean> global_connection_dont_timeout)

(<long> slow_server_startup_safety_zone_in_seconds)

(<boolean> find_all_fucked_up_shit)

(<boolean> error_suppress_all)

(<boolean> run_game_scripts)

(<long> debug_score)

(<boolean> object_prediction)

(<short> developer_mode)

(<real> mouse_acceleration)

(<boolean> debug_ice_cream_flavor_status_grunt_birthday_party)

(<boolean> debug_ice_cream_flavor_status_assassins)

(<boolean> debug_ice_cream_flavor_status_famine)

(<boolean> debug_ice_cream_flavor_status_i_would_have_been_your_daddy)

(<boolean> debug_ice_cream_flavor_status_blind)

(<boolean> debug_ice_cream_flavor_status_ghost)

(<boolean> debug_ice_cream_flavor_status_black_eye)

(<boolean> debug_ice_cream_flavor_status_catch)

(<boolean> debug_ice_cream_flavor_status_sputnik)

(<boolean> debug_ice_cream_flavor_status_mythic)

(<boolean> debug_ice_cream_flavor_status_anger)

(<boolean> debug_ice_cream_flavor_status_thunderstorm)

(<boolean> debug_ice_cream_flavor_status_iron)

(<boolean> debug_ice_cream_flavor_status_thats_just_wrong)

(<boolean> debug_ice_cream_flavor_status_bandanna)

(<boolean> debug_ice_cream_flavor_status_boom)

(<boolean> debug_ice_cream_flavor_status_eye_patch)

(<boolean> debug_ice_cream_flavor_status_fog)

(<boolean> debug_ice_cream_flavor_status_foreign)

(<boolean> debug_ice_cream_flavor_status_grunt_funeral)

(<boolean> debug_ice_cream_flavor_status_pinata)

(<boolean> debug_ice_cream_flavor_status_recession)

(<boolean> debug_ice_cream_flavor_status_malfunction)

(<boolean> debug_ice_cream_flavor_status_streaking)

(<boolean> debug_ice_cream_flavor_status_styx)

(<boolean> debug_ice_cream_flavor_status_feather)

(<boolean> debug_ice_cream_flavor_status_bonded_pair)

(<boolean> debug_ice_cream_flavor_status_masterblaster)

(<boolean> debug_ice_cream_flavor_force_coop)

(<real> game_speed_value)

(<boolean> game_paused)

