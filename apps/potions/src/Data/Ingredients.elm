module Data.Ingredients exposing
  ( Ingredient
  , ingredientsData
  , getIngredient
  )

import Data.Effects exposing ( Effect, getEffect )

import Dict
import List

type alias Ingredient =
  { name : String
  , effects : List Effect
  , value : Int
  , weight: Float
  }

nullIngredient : String -> Ingredient
nullIngredient s =
  { name = "(?)" ++ s
  , effects = []
  , value = 0
  , weight = 0.0
  }

getIngredient : String -> Ingredient
getIngredient s = 
  let gotVal = Dict.get s ingredientsData in
    case gotVal of
      Just i -> i
      _      -> nullIngredient s

type alias IngredientInfo =
  { effects : List String
  , value : Int
  , weight : Float
  }

ingredientsRaw : List (String, IngredientInfo)
ingredientsRaw = [
    ("Alit_Hide", {
        effects = [
            "Drain Intelligence",
            "Resist Poison",
            "Telekinesis",
            "Detect Animal"
        ],
        value = 5,
        weight = 1.0
    }),
    ("Ampoule_Pod", {
        effects = [
            "Water Walking",
            "Paralyze",
            "Detect Animal",
            "Drain Willpower"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Ash_Salts", {
        effects = [
            "Drain Agility",
            "Resist Magicka",
            "Cure Blight Disease",
            "Resist Magicka"
        ],
        value = 25,
        weight = 0.1
    }),
    ("Ash_Yam", {
        effects = [
            "Fortify Intelligence",
            "Fortify Strength",
            "Resist Common Disease",
            "Detect Key"
        ],
        value = 1,
        weight = 0.5
    }),
    ("Bittergreen_Petals", {
        effects = [
            "Restore Intelligence",
            "Invisibility",
            "Drain Endurance",
            "Drain Magicka"
        ],
        value = 5,
        weight = 0.1
    }),
    ("Black_Anther", {
        effects = [
            "Drain Agility",
            "Resist Fire",
            "Drain Endurance",
            "Light"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Black_Lichen", {
        effects = [
            "Drain Strength",
            "Resist Frost",
            "Drain Speed",
            "Cure Poison"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Bloat", {
        effects = [
            "Drain Magicka",
            "Fortify Intelligence",
            "Fortify Willpower",
            "Detect Animal"
        ],
        value = 5,
        weight = 0.1
    }),
    ("Bonemeal", {
        effects = [
            "Restore Agility",
            "Telekinesis",
            "Drain Fatigue",
            "Drain Personality"
        ],
        value = 2,
        weight = 0.2
    }),
    ("Bungler's_Bane", {
        effects = [
            "Drain Speed",
            "Drain Endurance",
            "Dispel",
            "Drain Strength"
        ],
        value = 1,
        weight = 0.5
    }),
    ("Chokeweed", {
        effects = [
            "Drain Luck",
            "Restore Fatigue",
            "Cure Common Disease",
            "Drain Willpower"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Coda_Flower", {
        effects = [
            "Drain Personality",
            "Levitate",
            "Drain Intelligence",
            "Drain Health"
        ],
        value = 23,
        weight = 0.1
    }),
    ("Comberry", {
        effects = [
            "Drain Fatigue",
            "Restore Magicka",
            "Fire Shield",
            "Reflect"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Corkbulb_Root", {
        effects = [
            "Cure Paralyzation",
            "Restore Health",
            "Lightning Shield",
            "Fortify Luck"
        ],
        value = 5,
        weight = 0.1
    }),
    ("Corprus_Weepings", {
        effects = [
            "Drain Fatigue",
            "Fortify Luck",
            "Drain Willpower",
            "Restore Health"
        ],
        value = 50,
        weight = 0.1
    }),
    ("Crab_Meat", {
        effects = [
            "Restore Fatigue",
            "Resist Shock",
            "Lightning Shield",
            "Restore Luck"
        ],
        value = 1,
        weight = 0.5
    }),
    ("Daedra_Skin", {
        effects = [
            "Fortify Strength",
            "Cure Common Disease",
            "Paralyze",
            "Swift Swim"
        ],
        value = 200,
        weight = 0.2
    }),
    ("Daedra's_Heart", {
        effects = [
            "Restore Magicka",
            "Fortify Endurance",
            "Drain Agility",
            "Night Eye"
        ],
        value = 200,
        weight = 1.0
    }),
    ("Diamond", {
        effects = [
            "Drain Agility",
            "Invisibility",
            "Reflect",
            "Detect Key"
        ],
        value = 250,
        weight = 0.2
    }),
    ("Dreugh_Wax", {
        effects = [
            "Fortify Strength",
            "Restore Strength",
            "Drain Luck",
            "Drain Willpower"
        ],
        value = 100,
        weight = 0.2
    }),
    ("Ectoplasm", {
        effects = [
            "Fortify Agility",
            "Detect Animal",
            "Drain Strength",
            "Drain Health"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Emerald", {
        effects = [
            "Fortify Magicka",
            "Restore Health",
            "Drain Agility",
            "Drain Endurance"
        ],
        value = 150,
        weight = 0.2
    }),
    ("Fire_Petal", {
        effects = [
            "Resist Fire",
            "Drain Health",
            "Spell Absorption",
            "Paralyze"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Fire_Salts", {
        effects = [
            "Drain Health",
            "Fortify Agility",
            "Resist Frost",
            "Fire Shield"
        ],
        value = 100,
        weight = 0.1
    }),
    ("Frost_Salts", {
        effects = [
            "Drain Speed",
            "Restore Magicka",
            "Frost Shield",
            "Resist Fire"
        ],
        value = 75,
        weight = 0.1
    }),
    ("Ghoul_Heart", {
        effects = [
            "Paralyze",
            "Cure Poison",
            "Fortify Attack"
        ],
        value = 150,
        weight = 0.5
    }),
    ("Gold_Kanet", {
        effects = [
            "Drain Health",
            "Burden",
            "Drain Luck",
            "Restore Strength"
        ],
        value = 5,
        weight = 0.1
    }),
    ("Gravedust", {
        effects = [
            "Drain Intelligence",
            "Cure Common Disease",
            "Drain Magicka",
            "Restore Endurance"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Green_Lichen", {
        effects = [
            "Fortify Personality",
            "Cure Common Disease",
            "Drain Strength",
            "Drain Health"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Guar_Hide", {
        effects = [
            "Drain Fatigue",
            "Fortify Endurance",
            "Restore Personality",
            "Fortify Luck"
        ],
        value = 5,
        weight = 1.0
    }),
    ("Hackle-Lo_Leaf", {
        effects = [
            "Restore Fatigue",
            "Paralyze",
            "Water Breathing",
            "Restore Luck"
        ],
        value = 30,
        weight = 0.1
    }),
    ("Heather", {
        effects = [
            "Restore Personality",
            "Feather",
            "Drain Speed",
            "Drain Personality"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Hound_Meat", {
        effects = [
            "Restore Fatigue",
            "Fortify Fatigue",
            "Reflect",
            "Detect Enchantment"
        ],
        value = 2,
        weight = 1.0
    }),
    ("Hypha_Facia", {
        effects = [
            "Drain Luck",
            "Drain Agility",
            "Drain Fatigue",
            "Detect Enchantment"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Kagouti_Hide", {
        effects = [
            "Drain Fatigue",
            "Fortify Speed",
            "Resist Common Disease",
            "Night Eye"
        ],
        value = 2,
        weight = 1.0
    }),
    ("Kresh_Fiber", {
        effects = [
            "Restore Luck",
            "Fortify Personality",
            "Drain Magicka",
            "Drain Speed"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Kwama_Cuttle", {
        effects = [
            "Resist Poison",
            "Drain Fatigue",
            "Water Walking",
            "Water Breathing"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Luminous_Russula", {
        effects = [
            "Water Breathing",
            "Drain Fatigue",
            "Poison"
        ],
        value = 1,
        weight = 0.2
    }),
    ("Marshmerrow", {
        effects = [
            "Restore Health",
            "Detect Enchantment",
            "Drain Willpower",
            "Drain Fatigue"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Muck", {
        effects = [
            "Drain Intelligence",
            "Detect Key",
            "Drain Personality",
            "Cure Common Disease"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Netch_Leather", {
        effects = [
            "Fortify Endurance",
            "Fortify Intelligence",
            "Drain Personality",
            "Cure Paralyzation"
        ],
        value = 1,
        weight = 1.0
    }),
    ("Pearl", {
        effects = [
            "Drain Agility",
            "Dispel",
            "Water Breathing",
            "Resist Common Disease"
        ],
        value = 100,
        weight = 0.2
    }),
    ("Racer_Plumes", {
        effects = [
            "Drain Willpower",
            "Levitate"
        ],
        value = 20,
        weight = 0.1
    }),
    ("Rat_Meat", {
        effects = [
            "Drain Magicka",
            "Paralyze",
            "Cure Poison",
            "Resist Poison"
        ],
        value = 1,
        weight = 1.0
    }),
    ("Red_Lichen", {
        effects = [
            "Drain Speed",
            "Light",
            "Cure Common Disease",
            "Drain Magicka"
        ],
        value = 25,
        weight = 0.1
    }),
    ("Resin", {
        effects = [
            "Restore Health",
            "Restore Speed",
            "Burden",
            "Resist Common Disease"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Roobrush", {
        effects = [
            "Drain Willpower",
            "Fortify Agility",
            "Drain Health",
            "Cure Poison"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Ruby", {
        effects = [
            "Drain Health",
            "Feather",
            "Restore Intelligence",
            "Drain Agility"
        ],
        value = 200,
        weight = 0.2
    }),
    ("Saltrice", {
        effects = [
            "Restore Fatigue",
            "Fortify Magicka",
            "Drain Strength",
            "Restore Health"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Scales", {
        effects = [
            "Drain Personality",
            "Water Walking",
            "Restore Endurance",
            "Swift Swim"
        ],
        value = 2,
        weight = 0.2
    }),
    ("Scamp_Skin", {
        effects = [
            "Drain Magicka",
            "Cure Paralyzation",
            "Restore Personality",
            "Restore Strength"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Scathecraw", {
        effects = [
            "Drain Strength",
            "Cure Poison",
            "Drain Health",
            "Restore Willpower"
        ],
        value = 2,
        weight = 0.1
    }),
    ("Scrap_Metal", {
        effects = [
            "Drain Health",
            "Lightning Shield",
            "Resist Shock",
            "Restore Intelligence"
        ],
        value = 20,
        weight = 10.0
    }),
    ("Scrib_Jelly", {
        effects = [
            "Fortify Willpower",
            "Cure Poison",
            "Cure Blight Disease",
            "Restore Willpower"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Scrib_Jerky", {
        effects = [
            "Restore Fatigue",
            "Fortify Fatigue",
            "Burden",
            "Swift Swim"
        ],
        value = 5,
        weight = 0.2
    }),
    ("Scuttle", {
        effects = [
            "Restore Fatigue",
            "Fortify Fatigue",
            "Feather",
            "Telekinesis"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Shalk_Resin", {
        effects = [
            "Drain Fatigue",
            "Fortify Health",
            "Drain Personality",
            "Fortify Speed"
        ],
        value = 50,
        weight = 0.1
    }),
    ("Sload_Soap", {
        effects = [
            "Drain Personality",
            "Fortify Agility",
            "Fire Shield",
            "Restore Agility"
        ],
        value = 50,
        weight = 0.1
    }),
    ("Small_Kwama_Egg", {
        effects = [
            "Restore Fatigue"
        ],
        value = 1,
        weight = 0.5
    }),
    ("Spore_Pod", {
        effects = [
            "Drain Strength",
            "Drain Fatigue",
            "Detect Key",
            "Paralyze"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Stoneflower_Petals", {
        effects = [
            "Restore Strength",
            "Fortify Magicka",
            "Drain Luck",
            "Fortify Personality"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Trama_Root", {
        effects = [
            "Restore Willpower",
            "Levitate",
            "Drain Magicka",
            "Drain Speed"
        ],
        value = 10,
        weight = 0.1
    }),
    ("Vampire_Dust", {
        effects = [
            "Fortify Health",
            "Fortify Strength",
            "Spell Absorption",
            "Vampirism"
        ],
        value = 500,
        weight = 0.1
    }),
    ("Violet_Coprinus", {
        effects = [
            "Water Walking",
            "Drain Fatigue",
            "Poison"
        ],
        value = 1,
        weight = 0.5
    }),
    ("Void_Salts", {
        effects = [
            "Restore Magicka",
            "Spell Absorption",
            "Paralyze",
            "Drain Endurance"
        ],
        value = 100,
        weight = 0.1
    }),
    ("Wickwheat", {
        effects = [
            "Restore Health",
            "Fortify Willpower",
            "Paralyze",
            "Damage Intelligence"
        ],
        value = 1,
        weight = 0.1
    }),
    ("Willow_Anther", {
        effects = [
            "Drain Personality",
            "Frost Shield",
            "Cure Common Disease",
            "Cure Paralyzation"
        ],
        value = 10,
        weight = 0.1
    })
  ]

parseIngredient : (String, IngredientInfo) -> Ingredient
parseIngredient (s, {effects, value, weight}) =
  { name = s
  , effects = List.map getEffect effects
  , value = value
  , weight = weight
  }

ingredientsData : Dict.Dict String Ingredient
ingredientsData = 
  let generateDict (name, ii) = (name, parseIngredient (name, ii))
  in Dict.fromList (List.map generateDict ingredientsRaw)
