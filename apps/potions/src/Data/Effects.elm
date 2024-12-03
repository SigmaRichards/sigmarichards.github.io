module Data.Effects exposing 
  ( Effect
  , EffectType
  , getEffect
  , effectsData
  )

import Dict
import List

type EffectType 
  = EffectPos
  | EffectNeg
  | EffectMix
  | EffectInvalid

type alias Effect =
  { name  : String
  , etype : EffectType
  }

getEffect : String -> Effect
getEffect s =
  let gotValue = Dict.get s effectsData
  in
    case gotValue of
      Just v -> v
      _      -> { name = s, etype = EffectInvalid }

effectsRaw : List (String, EffectType)
effectsRaw = 
  [
    ("Drain Intelligence", EffectNeg),
    ("Resist Poison", EffectPos),
    ("Telekinesis", EffectPos),
    ("Detect Animal", EffectPos),
    ("Water Walking", EffectPos),
    ("Paralyze", EffectNeg),
    ("Drain Willpower", EffectNeg),
    ("Drain Agility", EffectNeg),
    ("Resist Magicka", EffectPos),
    ("Cure Blight Disease", EffectPos),
    ("Fortify Intelligence", EffectPos),
    ("Fortify Strength", EffectPos),
    ("Resist Common Disease", EffectPos),
    ("Detect Key", EffectPos),
    ("Restore Intelligence", EffectPos),
    ("Invisibility", EffectPos),
    ("Drain Endurance", EffectNeg),
    ("Drain Magicka", EffectNeg),
    ("Resist Fire", EffectPos),
    ("Light", EffectPos),
    ("Drain Strength", EffectNeg),
    ("Resist Frost", EffectPos),
    ("Drain Speed", EffectNeg),
    ("Cure Poison", EffectPos),
    ("Fortify Willpower", EffectPos),
    ("Restore Agility", EffectPos),
    ("Drain Fatigue", EffectNeg),
    ("Drain Personality", EffectNeg),
    ("Restore Fatigue", EffectPos),
    ("Dispel", EffectMix),
    ("Drain Luck", EffectNeg),
    ("Cure Common Disease", EffectPos),
    ("Levitate", EffectPos),
    ("Drain Health", EffectNeg),
    ("Restore Magicka", EffectPos),
    ("Fire Shield", EffectPos),
    ("Reflect", EffectPos),
    ("Cure Paralyzation", EffectPos),
    ("Restore Health", EffectPos),
    ("Lightning Shield", EffectPos),
    ("Fortify Luck", EffectPos),
    ("Resist Shock", EffectPos),
    ("Restore Luck", EffectPos),
    ("Swift Swim", EffectPos),
    ("Fortify Endurance", EffectPos),
    ("Night Eye", EffectPos),
    ("Restore Strength", EffectPos),
    ("Fortify Agility", EffectPos),
    ("Fortify Magicka", EffectPos),
    ("Spell Absorption", EffectPos),
    ("Frost Shield", EffectPos),
    ("Fortify Attack", EffectPos),
    ("Burden", EffectNeg),
    ("Restore Endurance", EffectPos),
    ("Fortify Personality", EffectPos),
    ("Restore Personality", EffectPos),
    ("Water Breathing", EffectPos),
    ("Feather", EffectPos),
    ("Fortify Fatigue", EffectPos),
    ("Detect Enchantment", EffectPos),
    ("Fortify Speed", EffectPos),
    ("Fortify Health", EffectPos),
    ("Poison", EffectNeg),
    ("Restore Speed", EffectPos),
    ("Restore Willpower", EffectPos),
    ("Vampirism", EffectNeg),
    ("Damage Intelligence", EffectNeg)
  ]

effectFromData : (String, EffectType) -> Effect
effectFromData (name, etype) = { name = name, etype = etype }

effectsData : Dict.Dict String Effect
effectsData = 
  let generateDict (name, etype) = (name, effectFromData (name, etype))
  in Dict.fromList (List.map generateDict effectsRaw)
