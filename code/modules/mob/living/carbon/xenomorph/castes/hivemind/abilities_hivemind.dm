/datum/action/xeno_action/return_to_core
	name = "Return to Core"
	action_icon_state = "lay_hivemind"
	mechanics_text = "Teleport back to your core."

/datum/action/xeno_action/return_to_core/action_activate()
	SEND_SIGNAL(owner, COMSIG_XENOMORPH_CORE_RETURN)

/datum/action/xeno_action/activable/secrete_resin/ranged/slow
	base_wait = 1 SECONDS
	max_range = 4

/datum/action/xeno_action/change_form
	name = "Change form"
	action_icon_state = "manifest"
	mechanics_text = "Change from your incorporal form to your physical on and vice-versa."

/datum/action/xeno_action/change_form/action_activate()
	var/mob/living/carbon/xenomorph/xenomorph_owner = owner
	xenomorph_owner.change_form()

/datum/action/xeno_action/command_minions
	name = "Command minions"

/datum/action/xeno_action/activable/command_minions
	name = "Command minions"
	action_icon_state = "rally_minions"
	mechanics_text = "Command all minions, ordering them to converge on this location."
	ability_name = "command minions"
	plasma_cost = 100
	keybind_signal = COMSIG_XENOABILITY_RALLY_MINION
	keybind_flags = XACT_KEYBIND_USE_ABILITY
	cooldown_timer = 60 SECONDS
	use_state_flags = XACT_USE_LYING|XACT_USE_BUCKLED

/datum/action/xeno_action/activable/command_minions/use_ability(atom/target)
	var/turf_targeted = get_turf(target)
	if(!turf_targeted)
		return
	new /obj/effect/ai_node/goal(turf_targeted, owner)
	succeed_activate()
	add_cooldown()
