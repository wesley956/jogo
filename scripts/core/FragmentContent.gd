extends RefCounted
class_name FragmentContent

const C_CELESTIAL: Color = Color(0.322, 0.902, 1.0, 1.0)
const C_JADE: Color = Color(0.384, 0.949, 0.706, 1.0)
const C_NEBULA: Color = Color(0.541, 0.361, 1.0, 1.0)
const C_GOLD: Color = Color(1.0, 0.851, 0.502, 1.0)
const C_PEARL: Color = Color(0.918, 0.984, 1.0, 1.0)

const SKIN_ORDER: Array[String] = [
	"nucleo_errante",
	"semente_jade",
	"orbe_celestial",
	"coracao_nebular",
	"essencia_dourada"
]

const SKINS: Dictionary = {
	"nucleo_errante": {"name": "Núcleo Errante", "price": 0, "desc": "Forma inicial equilibrada."},
	"semente_jade": {"name": "Semente de Jade", "price": 1000, "desc": "Cultivo sereno e energia verde."},
	"orbe_celestial": {"name": "Orbe Celestial", "price": 2500, "desc": "Pureza luminosa do céu fragmentado."},
	"coracao_nebular": {"name": "Coração Nebular", "price": 4000, "desc": "Ressonância roxa e misteriosa."},
	"essencia_dourada": {"name": "Essência Dourada", "price": 6500, "desc": "Forma rara de ascensão cristalina."}
}

const TECHNIQUES: Dictionary = {
	"dash": {"name": "Passo Espiritual", "max": 5, "base_price": 650, "desc": "Reduz a recarga do dash."},
	"jade": {"name": "Chamado do Jade", "max": 5, "base_price": 800, "desc": "Aumenta a duração do ímã."},
	"flow": {"name": "Estado de Fluxo", "max": 5, "base_price": 1000, "desc": "Aumenta a duração da ascensão."}
}

const CULTIVATION_STAGES: Array[String] = [
	"Fluxo Inicial",
	"Qi Desperto",
	"Núcleo Refinado",
	"Fluxo Celestial",
	"Ascensão Cristalina"
]

const RESONANCE_CIRCLES: Array[Dictionary] = [
	{
		"name": "Círculo Ciano",
		"xp": 500,
		"color": Color(0.322, 0.902, 1.0, 1.0),
		"effect": "+Ressonância ao coletar cristais"
	},
	{
		"name": "Círculo de Jade",
		"xp": 1400,
		"color": Color(0.384, 0.949, 0.706, 1.0),
		"effect": "+Alcance do Chamado do Jade"
	},
	{
		"name": "Círculo Nebular",
		"xp": 3000,
		"color": Color(0.541, 0.361, 1.0, 1.0),
		"effect": "+Bônus em Ressonância Perfeita"
	},
	{
		"name": "Círculo Dourado",
		"xp": 6000,
		"color": Color(1.0, 0.851, 0.502, 1.0),
		"effect": "+Valor dos Cristais Raros"
	},
	{
		"name": "Círculo Celestial",
		"xp": 10000,
		"color": Color(0.918, 0.984, 1.0, 1.0),
		"effect": "+Duração do Estado de Fluxo"
	}
]

const BIOMES: Array[Dictionary] = [
	{
		"name": "Trilha do Céu Fragmentado",
		"at": 0.0,
		"deep": Color(0.027, 0.078, 0.149, 1.0),
		"mist": Color(0.035, 0.120, 0.210, 1.0),
		"accent": Color(0.322, 0.902, 1.0, 1.0),
		"secondary": Color(0.384, 0.949, 0.706, 1.0)
	},
	{
		"name": "Vale de Jade Suspenso",
		"at": 700.0,
		"deep": Color(0.018, 0.105, 0.115, 1.0),
		"mist": Color(0.035, 0.175, 0.155, 1.0),
		"accent": Color(0.384, 0.949, 0.706, 1.0),
		"secondary": Color(0.322, 0.902, 1.0, 1.0)
	},
	{
		"name": "Ruínas da Lua Partida",
		"at": 1500.0,
		"deep": Color(0.050, 0.042, 0.145, 1.0),
		"mist": Color(0.105, 0.070, 0.225, 1.0),
		"accent": Color(0.541, 0.361, 1.0, 1.0),
		"secondary": Color(1.0, 0.851, 0.502, 1.0)
	},
	{
		"name": "Portão da Ascensão",
		"at": 2500.0,
		"deep": Color(0.115, 0.070, 0.028, 1.0),
		"mist": Color(0.190, 0.115, 0.045, 1.0),
		"accent": Color(1.0, 0.851, 0.502, 1.0),
		"secondary": Color(0.918, 0.984, 1.0, 1.0)
	}
]

const DEFAULT_TECHNIQUE_LEVELS: Dictionary = {"dash": 0, "jade": 0, "flow": 0}
const DEFAULT_OWNED_SKINS: Dictionary = {"nucleo_errante": true}

static func skin_rarity(skin_id: String) -> String:
	match skin_id:
		"nucleo_errante":
			return "Comum"
		"semente_jade", "orbe_celestial":
			return "Raro"
		"coracao_nebular":
			return "Épico"
		"essencia_dourada":
			return "Lendário"
		_:
			return "Comum"

static func skin_secondary_color(skin_id: String) -> Color:
	match skin_id:
		"semente_jade":
			return Color(0.74, 1.0, 0.83, 1.0)
		"orbe_celestial":
			return Color(0.92, 0.98, 1.0, 1.0)
		"coracao_nebular":
			return Color(0.22, 0.12, 0.42, 1.0)
		"essencia_dourada":
			return Color(1.0, 0.94, 0.70, 1.0)
		_:
			return Color(0.65, 0.96, 1.0, 1.0)

static func skin_trail_name(skin_id: String) -> String:
	match skin_id:
		"semente_jade":
			return "Rastro de Jade"
		"orbe_celestial":
			return "Rastro Celestial"
		"coracao_nebular":
			return "Rastro Nebular"
		"essencia_dourada":
			return "Rastro Dourado"
		_:
			return "Rastro Cristalino"

static func skin_shape_variant(skin_id: String) -> int:
	match skin_id:
		"semente_jade":
			return 1
		"orbe_celestial":
			return 2
		"coracao_nebular":
			return 3
		"essencia_dourada":
			return 4
		_:
			return 0

static func skin_effect_text(skin_id: String) -> String:
	match skin_id:
		"semente_jade":
			return "%s · Chamado do Jade" % skin_trail_name(skin_id)
		"orbe_celestial":
			return "%s · XP espiritual" % skin_trail_name(skin_id)
		"coracao_nebular":
			return "%s · Ressonância" % skin_trail_name(skin_id)
		"essencia_dourada":
			return "%s · Cristais raros" % skin_trail_name(skin_id)
		_:
			return "%s · Equilíbrio" % skin_trail_name(skin_id)

static func skin_affinity_text(skin_id: String) -> String:
	match skin_id:
		"semente_jade":
			return "Jade · Harmonia"
		"orbe_celestial":
			return "Céu · Pureza"
		"coracao_nebular":
			return "Nebular · Ressonância"
		"essencia_dourada":
			return "Ascensão · Fortuna"
		_:
			return "Cristal · Equilíbrio"

static func skin_rarity_power(skin_id: String) -> float:
	match skin_rarity(skin_id):
		"Raro":
			return 1.15
		"Épico":
			return 1.35
		"Lendário":
			return 1.62
		"Celestial":
			return 1.85
		_:
			return 1.0

static func skin_color(skin_id: String) -> Color:
	match skin_id:
		"semente_jade":
			return C_JADE
		"orbe_celestial":
			return Color(0.90, 0.98, 1.0, 1.0)
		"coracao_nebular":
			return C_NEBULA
		"essencia_dourada":
			return C_GOLD
		"nucleo_vazio":
			return Color(0.16, 0.09, 0.31, 1.0)
		_:
			return C_CELESTIAL
