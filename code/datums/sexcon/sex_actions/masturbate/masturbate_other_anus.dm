/datum/sex_action/masturbate_other_anus
	name = "Finger their butt"
	check_same_tile = FALSE

/datum/sex_action/masturbate_other_anus/shows_on_menu(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/masturbate_other_anus/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv == HIDECROTCH)
				return FALSE
	return TRUE

/datum/sex_action/masturbate_other_anus/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts fingering [target]'s butt..."))

/datum/sex_action/masturbate_other_anus/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers [target]'s butt..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(target, 2, 6, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_other_anus/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops fingering [target]'s butt."))

/datum/sex_action/masturbate_other_anus/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
