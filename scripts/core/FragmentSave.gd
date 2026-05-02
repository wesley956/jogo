extends RefCounted
class_name FragmentSave

const FragmentContent = preload("res://scripts/core/FragmentContent.gd")

const SAVE_PATH: String = "user://fragment_rush_save.json"

static func build_save_data(best_distance: float, total_crystals: int, selected_skin: String, owned_skins: Dictionary, last_daily_reward: String, tutorial_seen: bool, cultivation_xp: int, technique_levels: Dictionary) -> Dictionary:
	return {
		"best_distance": best_distance,
		"total_crystals": total_crystals,
		"selected_skin": selected_skin,
		"owned_skins": owned_skins,
		"last_daily_reward": last_daily_reward,
		"tutorial_seen": tutorial_seen,
		"cultivation_xp": cultivation_xp,
		"technique_levels": technique_levels
	}

static func write_game(data: Dictionary) -> void:
	var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file != null:
		file.store_string(JSON.stringify(data))

static func read_game() -> Dictionary:
	if not FileAccess.file_exists(SAVE_PATH):
		return {}
	var file: FileAccess = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if file == null:
		return {}
	var parsed: Variant = JSON.parse_string(file.get_as_text())
	return normalize_save_data(parsed)

static func normalize_save_data(parsed: Variant) -> Dictionary:
	var normalized: Dictionary = build_save_data(
		0.0,
		0,
		"nucleo_errante",
		FragmentContent.DEFAULT_OWNED_SKINS.duplicate(true),
		"",
		false,
		0,
		FragmentContent.DEFAULT_TECHNIQUE_LEVELS.duplicate(true)
	)
	if typeof(parsed) != TYPE_DICTIONARY:
		return normalized

	normalized["best_distance"] = float(parsed.get("best_distance", 0.0))
	normalized["total_crystals"] = int(parsed.get("total_crystals", 0))
	normalized["selected_skin"] = str(parsed.get("selected_skin", "nucleo_errante"))
	normalized["last_daily_reward"] = str(parsed.get("last_daily_reward", ""))
	normalized["tutorial_seen"] = bool(parsed.get("tutorial_seen", false))
	normalized["cultivation_xp"] = int(parsed.get("cultivation_xp", 0))

	var loaded_techniques: Variant = parsed.get("technique_levels", FragmentContent.DEFAULT_TECHNIQUE_LEVELS)
	if typeof(loaded_techniques) == TYPE_DICTIONARY:
		normalized["technique_levels"] = FragmentContent.DEFAULT_TECHNIQUE_LEVELS.duplicate(true)
		for tech_id in loaded_techniques.keys():
			normalized["technique_levels"][str(tech_id)] = int(loaded_techniques[tech_id])

	var loaded_skins: Variant = parsed.get("owned_skins", FragmentContent.DEFAULT_OWNED_SKINS)
	if typeof(loaded_skins) == TYPE_DICTIONARY:
		normalized["owned_skins"] = FragmentContent.DEFAULT_OWNED_SKINS.duplicate(true)
		for skin_id in loaded_skins.keys():
			normalized["owned_skins"][str(skin_id)] = bool(loaded_skins[skin_id])
	normalized["owned_skins"]["nucleo_errante"] = true

	if not bool(normalized["owned_skins"].get(str(normalized["selected_skin"]), false)):
		normalized["selected_skin"] = "nucleo_errante"

	return normalized
