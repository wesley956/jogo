extends RefCounted
class_name FragmentRunLogic

const FragmentContent = preload("res://scripts/core/FragmentContent.gd")

static func calculate_run_missions(distance: float, crystals_run: int, perfect_grazes: int, flow_activations: int, combo: int, rare_crystals_run: int, current_biome_index: int) -> Array[String]:
	var missions: Array[String] = []
	if int(distance) >= 500:
		missions.append("✓ Atravessou 500m da Trilha")
	if crystals_run >= 60:
		missions.append("✓ Coletou 60 Cristais Espirituais")
	if perfect_grazes >= 5:
		missions.append("✓ Alcançou 5 Ressonâncias Perfeitas")
	if flow_activations >= 1:
		missions.append("✓ Entrou em Estado de Fluxo")
	if combo >= 18:
		missions.append("✓ Sustentou Fluxo x18")
	if rare_crystals_run >= 3:
		missions.append("✓ Coletou 3 Cristais Raros")
	if current_biome_index >= 1:
		missions.append("✓ Alcançou o Vale de Jade")
	return missions

static func calculate_xp_gain(distance: float, perfect_grazes: int, flow_activations: int, rare_crystals_run: int, current_biome_index: int, completed_run_missions_size: int, combo: int) -> int:
	var gain: int = int(distance * 0.06)
	gain += perfect_grazes * 9
	gain += flow_activations * 24
	gain += rare_crystals_run * 12
	gain += current_biome_index * 30
	gain += completed_run_missions_size * 18
	gain += int(max(combo, 1) * 0.8)
	return max(gain, 8)

static func technique_price(tech_id: String, current_level: int) -> int:
	var data: Dictionary = FragmentContent.TECHNIQUES.get(tech_id, {})
	return int(data.get("base_price", 0)) + current_level * 550

static func current_day_key() -> String:
	var date: Dictionary = Time.get_date_dict_from_system()
	return "%04d-%02d-%02d" % [int(date["year"]), int(date["month"]), int(date["day"])]

static func get_biome_index_for_distance(value: float, biomes: Array[Dictionary]) -> int:
	var idx: int = 0
	for i: int in range(biomes.size()):
		var biome: Dictionary = biomes[i]
		if value >= float(biome.get("at", 0.0)):
			idx = i
	return idx
