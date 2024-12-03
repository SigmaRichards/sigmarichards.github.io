module Data.Merchants exposing ( Merchant, merchantsData, getMerchant )

import Data.Ingredients exposing ( Ingredient, getIngredient )

import List
import Dict

type alias Merchant =
  { name : String
  , location : String
  , gold : Int
  , ingredients : List (Ingredient, Int)
  }

type alias MerchantRaw =
  { name : String
  , location : String
  , gold : Int
  , ingredients : List (String, Int)
  }

parseMerchant : MerchantRaw -> Merchant
parseMerchant {name, location, gold, ingredients} =
  let
    processIngredient (s, q) = (getIngredient s, q)
  in
    { name = name
    , location = location
    , gold = gold
    , ingredients = List.map processIngredient ingredients
    }

merchantsData = 
  let
    parser {name, location, gold, ingredients} =
      ( name
      , parseMerchant 
        { name = name
        , location = location
        , gold = gold
        , ingredients = ingredients
        }
      )
  in
    Dict.fromList <| List.map parser merchantsRaw

nullMerchant : String -> Merchant
nullMerchant s =
  { name = "(?) " ++ s
  , location = "(?)"
  , gold = 0
  , ingredients = []
  }

getMerchant : String -> Merchant
getMerchant s = 
  let gotVal = Dict.get s merchantsData in
    case gotVal of
      Just i -> i
      _      -> nullMerchant s

 -- RAW DATA

merchantsRaw : List MerchantRaw
merchantsRaw = 
  [ { name = "Ajira",
      location = "Balmora, Guild of Mages",
      gold = 800,
      ingredients = [
          ("Black_Anther", 5),
          ("Comberry", 5),
          ("Crab_Meat", 5),
          ("Heather", 5),
          ("Hound_Meat", 5),
          ("Kwama_Cuttle", 5),
          ("Scales", 5),
          ("Small_Kwama_Egg", 5),
          ("Willow_Anther", 5)
        ]}
  , { name = "Anarenen",
      location = "Ald'ruhn, Guild of Mages",
      gold = 400,
      ingredients = [
          ("Bloat", 5),
          ("Bonemeal", 5),
          ("Comberry", 10),
          ("Crab_Meat", 10),
          ("Diamond", 2),
          ("Fire_Salts", 5),
          ("Heather", 10),
          ("Vampire_Dust", 1)
        ]}
  , { name = "Andil",
      location = "Tel Vos, Services Tower",
      gold = 400,
      ingredients = [
          ("Black_Anther", 10),
          ("Gold_Kanet", 10),
          ("Kresh_Fiber", 5),
          ("Marshmerrow", 10),
          ("Scathecraw", 10),
          ("Shalk_Resin", 5),
          ("Stoneflower_Petals", 10)
        ]}
  , { name = "Andilu Drothan",
      location = "Vivec Foreign Quarter, Andilu Drothan: Alchemist",
      gold = 200,
      ingredients = [
          ("Comberry", 5),
          ("Gold_Kanet", 5),
          ("Heather", 5),
          ("Muck", 5),
          ("Scrap_Metal", 4),
          ("Sload_Soap", 5),
          ("Trama_Root", 5)
        ]}
  , { name = "Anis Seloth",
      location = "Sadrith Mora, Anis Seloth: Alchemist",
      gold = 800,
      ingredients = [
          ("Alit_Hide", 5),
          ("Bloat", 10),
          ("Bonemeal", 10),
          ("Coda_Flower", 10),
          ("Daedra_Skin", 2),
          ("Daedra's_Heart", 2),
          ("Diamond", 4),
          ("Fire_Salts", 5),
          ("Frost_Salts", 5),
          ("Ghoul_Heart", 2),
          ("Hackle-Lo_Leaf", 10),
          ("Heather", 10),
          ("Hypha_Facia", 10),
          ("Kwama_Cuttle", 10),
          ("Luminous_Russula", 10),
          ("Muck", 10),
          ("Pearl", 4),
          ("Ruby", 4),
          ("Scales", 10),
          ("Scrap_Metal", 5),
          ("Sload_Soap", 10),
          ("Trama_Root", 10),
          ("Vampire_Dust", 2),
          ("Violet_Coprinus", 10),
          ("Wickwheat", 10),
          ("Willow_Anther", 10)
        ]}
  , { name = "Arnand Liric",
      location = "Buckmoth Legion Fort, Interior",
      gold = 250,
      ingredients = [
          ("Corprus_Weepings", 5),
          ("Gravedust", 10),
          ("Hound_Meat", 10),
          ("Netch_Leather", 5),
          ("Scamp_Skin", 5),
          ("Scrib_Jelly", 10)
        ]}
  , { name = "Arrille",
      location = "Seyda Neen, Arrille's Tradehouse",
      gold = 800,
      ingredients = [
          ("Corkbulb_Root", 5),
          ("Scrib_Jerky", 5),
          ("Shalk_Resin", 5)
        ]}
  , { name = "Aunius Autrus",
      location = "Wolverine Hall, Imperial Shrine",
      gold = 200,
      ingredients = [
          ("Ash_Yam", 10),
          ("Bloat", 5),
          ("Gravedust", 5),
          ("Guar_Hide", 5),
          ("Netch_Leather", 5),
          ("Scamp_Skin", 5),
          ("Scrib_Jerky", 10)
        ]}
  , { name = "Aurane Frernis",
      location = "Vivec, Foreign Quarter, Aurane Frernis: Apothecary",
      gold = 300,
      ingredients = [
          ("Black_Anther", 5),
          ("Coda_Flower", 5),
          ("Corprus_Weepings", 3),
          ("Green_Lichen", 5),
          ("Hypha_Facia", 5),
          ("Red_Lichen", 5),
          ("Resin", 5),
          ("Shalk_Resin", 5)
        ]}
  , { name = "Bildren Areleth",
      location = "Tel Aruhn, Bildren Areleth: Apothecary",
      gold = 325,
      ingredients = [
          ("Bittergreen_Petals", 10),
          ("Ectoplasm", 5),
          ("Heather", 10),
          ("Kagouti_Hide", 5),
          ("Kresh_Fiber", 10),
          ("Resin", 5),
          ("Stoneflower_Petals", 10)
        ]}
  , { name = "Brarayni Sarys",
      location = "Tel Aruhn, Tower Entry",
      gold = 450,
      ingredients = [
          ("Black_Anther", 10),
          ("Coda_Flower", 5),
          ("Daedra_Skin", 2),
          ("Diamond", 2),
          ("Ghoul_Heart", 1),
          ("Heather", 10),
          ("Muck", 10),
          ("Racer_Plumes", 10),
          ("Sload_Soap", 5),
          ("Spore_Pod", 5),
          ("Vampire_Dust", 1)
        ]}
  , { name = "Chaplain Ogrul",
      location = "Gnisis, Fort Darius",
      gold = 250,
      ingredients = [
          ("Ash_Yam", 10),
          ("Crab_Meat", 10),
          ("Marshmerrow", 10),
          ("Rat_Meat", 10),
          ("Saltrice", 10),
          ("Wickwheat", 10)
        ]}
  , { name = "Cienne Sintieve",
      location = "Ald'ruhn, Cienne Sintieve: Alchemist",
      gold = 300,
      ingredients = [
          ("Ampoule_Pod", 10),
          ("Coda_Flower", 10),
          ("Frost_Salts", 3),
          ("Hound_Meat", 10),
          ("Kwama_Cuttle", 10),
          ("Racer_Plumes", 5),
          ("Scrap_Metal", 5),
          ("Small_Kwama_Egg", 10),
          ("Spore_Pod", 10),
          ("Violet_Coprinus", 5),
          ("Void_Salts", 5)
        ]}
  , { name = "Cocistian Quaspus",
      location = "Buckmoth Legion Fort",
      gold = 200,
      ingredients = [
          ("Bittergreen_Petals", 10),
          ("Emerald", 2),
          ("Fire_Petal", 5),
          ("Kresh_Fiber", 10),
          ("Rat_Meat", 10),
          ("Scathecraw", 10),
          ("Stoneflower_Petals", 5)
        ]}
  , { name = "Craetia Jullalian",
      location = "Vivec Foreign Quarter, Guild of Mages",
      gold = 400,
      ingredients = [
          ("Alit_Hide", 5),
          ("Ampoule_Pod", 5),
          ("Bloat", 5),
          ("Corkbulb_Root", 5),
          ("Crab_Meat", 5),
          ("Daedra's_Heart", 1),
          ("Diamond", 2),
          ("Emerald", 2),
          ("Fire_Salts", 5),
          ("Frost_Salts", 5),
          ("Ghoul_Heart", 1),
          ("Pearl", 2),
          ("Racer_Plumes", 5),
          ("Ruby", 2)
        ]}
  , { name = "Danoso Andrano",
      location = "Ald'ruhn, Temple",
      gold = 300,
      ingredients = [
          ("Bungler's_Bane", 10),
          ("Coda_Flower", 10),
          ("Dreugh_Wax", 5),
          ("Ectoplasm", 5),
          ("Hypha_Facia", 10),
          ("Marshmerrow", 10),
          ("Pearl", 3),
          ("Roobrush", 10),
          ("Spore_Pod", 10),
          ("Wickwheat", 10)
        ]}
  , { name = "Daynali Dren",
      location = "Tel Mora, Lower Tower",
      gold = 3999,
      ingredients = [
          ("Alit_Hide", 5),
          ("Black_Anther", 10),
          ("Bloat", 10),
          ("Crab_Meat", 10),
          ("Diamond", 3),
          ("Frost_Salts", 5),
          ("Gold_Kanet", 10),
          ("Hackle-Lo_Leaf", 10),
          ("Hound_Meat", 10),
          ("Racer_Plumes", 10),
          ("Ruby", 4),
          ("Scales", 10),
          ("Scrap_Metal", 5),
          ("Trama_Root", 10),
          ("Willow_Anther", 10)
        ]}
  , { name = "Dralval Andrano",
      location = "Balmora, Temple",
      gold = 250,
      ingredients = [
          ("Black_Lichen", 5),
          ("Bungler's_Bane", 5),
          ("Green_Lichen", 5),
          ("Hypha_Facia", 5),
          ("Kagouti_Hide", 5),
          ("Marshmerrow", 5),
          ("Red_Lichen", 5),
          ("Scathecraw", 5),
          ("Wickwheat", 5)
        ]}
  , { name = "Dulian",
      location = "Buckmoth Legion Fort, Interior",
      gold = 200,
      ingredients = [
          ("Ash_Yam", 10),
          ("Kwama_Cuttle", 10),
          ("Muck", 5),
          ("Resin", 5),
          ("Scrib_Jerky", 10),
          ("Trama_Root", 5),
          ("Willow_Anther", 5)
        ]}
  , { name = "Eldrilu Dalen",
      location = "Vos, Vos Chapel",
      gold = 250,
      ingredients = [
          ("Ash_Salts", 5),
          ("Ash_Yam", 5),
          ("Corkbulb_Root", 10),
          ("Fire_Salts", 5),
          ("Guar_Hide", 10),
          ("Netch_Leather", 10),
          ("Saltrice", 10),
          ("Scrib_Jelly", 5),
          ("Scrib_Jerky", 5)
        ]}
  , { name = "Ernand Thierry",
      location = "Caldera, Guild of Mages",
      gold = 300,
      ingredients = [
          ("Alit_Hide", 5),
          ("Ampoule_Pod", 5),
          ("Coda_Flower", 5),
          ("Corkbulb_Root", 5),
          ("Luminous_Russula", 5),
          ("Spore_Pod", 5),
          ("Violet_Coprinus", 5)
        ]}
  , { name = "Felara Andrethi",
      location = "Tel Aruhn, Tower Living Quarters",
      gold = 300,
      ingredients = [
          ("Chokeweed", 4),
          ("Comberry", 10),
          ("Marshmerrow", 10),
          ("Rat_Meat", 10),
          ("Saltrice", 10),
          ("Scamp_Skin", 5),
          ("Scuttle", 5),
          ("Small_Kwama_Egg", 10)
        ]}
  , { name = "Folvys Andalor",
      location = "Ald'ruhn Temple",
      gold = 300,
      ingredients = [
          ("Ash_Salts", 5),
          ("Corprus_Weepings", 5),
          ("Emerald", 3),
          ("Guar_Hide", 10),
          ("Rat_Meat", 10),
          ("Scamp_Skin", 10),
          ("Scrib_Jelly", 10),
          ("Scrib_Jerky", 10),
          ("Scuttle", 10)
        ]}
  , { name = "Galsa AndranoTR",
      location = "Mournhold Temple: Infirmary",
      gold = 1000,
      ingredients = [
          ("Horn_Lily_Bulb", 5),
          ("Nirthfly_Stalks", 5),
          ("Scrib_Jerky", 5),
          ("Sweetpulp", 5)
        ]}
  , { name = "Galuro Belan",
      location = "Vivec, Telvanni Apothecary",
      gold = 200,
      ingredients = [
          ("Ectoplasm", 3),
          ("Fire_Petal", 5),
          ("Kagouti_Hide", 5),
          ("Kresh_Fiber", 5),
          ("Scathecraw", 5),
          ("Stoneflower_Petals", 5)
        ]}
  , { name = "Ganalyn Saram",
      location = "Vivec, Hlaalu Alchemist",
      gold = 350,
      ingredients = [
          ("Bungler's_Bane", 5),
          ("Corkbulb_Root", 5),
          ("Hound_Meat", 5),
          ("Kwama_Cuttle", 5),
          ("Scales", 5),
          ("Spore_Pod", 5),
          ("Willow_Anther", 5)
        ]}
  , { name = "Garas Seloth",
      location = "Vivec, Telvanni Alchemist",
      gold = 350,
      ingredients = [
          ("Bonemeal", 5),
          ("Daedra_Skin", 2),
          ("Hackle-Lo_Leaf", 5),
          ("Pearl", 2),
          ("Racer_Plumes", 5),
          ("Void_Salts", 2),
          ("Wickwheat", 5)
        ]}
  , { name = "Gils Drelas",
      location = "Tel Branora, Upper Tower: Therana's Chamber",
      gold = 600,
      ingredients = [
          ("Daedra's_Heart", 2),
          ("Fire_Salts", 4),
          ("Frost_Salts", 4),
          ("Gold_Kanet", 10),
          ("Hackle-Lo_Leaf", 10),
          ("Pearl", 3),
          ("Ruby", 3),
          ("Scales", 10),
          ("Scrap_Metal", 5),
          ("Trama_Root", 5),
          ("Void_Salts", 2),
          ("Willow_Anther", 10)
        ]}
  , { name = "Guls Llervu",
      location = "Ald'ruhn, Guls Llervu's House",
      gold = 150,
      ingredients = [
          ("Corkbulb_Root", 5),
          ("Kagouti_Hide", 5),
          ("Resin", 5),
          ("Saltrice", 5),
          ("Scathecraw", 5),
          ("Scuttle", 5)
        ]}
  , { name = "Irna Maryon",
      location = "Tel Aruhn, Tower Entry",
      gold = 300,
      ingredients = [
          ("Black_Lichen", 3),
          ("Emerald", 2),
          ("Fire_Petal", 10),
          ("Green_Lichen", 3),
          ("Kwama_Cuttle", 5),
          ("Red_Lichen", 3),
          ("Roobrush", 5),
          ("Scathecraw", 10),
          ("Wickwheat", 10)
        ]}
  , { name = "J'Rasha",
      location = "Vivec, Foreign Quarter, J'Rasha: Healer",
      gold = 300,
      ingredients = [
          ("Ash_Yam", 5),
          ("Chokeweed", 5),
          ("Marshmerrow", 5),
          ("Saltrice", 5),
          ("Scamp_Skin", 3),
          ("Scuttle", 5),
          ("Small_Kwama_Egg", 5)
        ]}
  , { name = "Jolda",
      location = "Tel Mora, Jolda: Apothecary",
      gold = 400,
      ingredients = [
          ("Ampoule_Pod", 5),
          ("Black_Lichen", 5),
          ("Bungler's_Bane", 5),
          ("Dreugh_Wax", 5),
          ("Hypha_Facia", 5),
          ("Luminous_Russula", 10),
          ("Pearl", 2),
          ("Resin", 10),
          ("Violet_Coprinus", 10),
          ("Void_Salts", 5)
        ]}
  , { name = "Llarara Omayn",
      location = "Balmora, Temple",
      gold = 150,
      ingredients = [
          ("Corkbulb_Root", 5),
          ("Ectoplasm", 5),
          ("Hackle-Lo_Leaf", 5),
          ("Saltrice", 5),
          ("Scrib_Jerky", 5),
          ("Shalk_Resin", 5),
          ("Wickwheat", 5)
        ]}
  , { name = "Llathyno Hlaalu",
      location = "Balmora, Temple",
      gold = 300,
      ingredients = [
          ("Gravedust", 5),
          ("Kresh_Fiber", 5),
          ("Muck", 5),
          ("Resin", 5),
          ("Scrib_Jelly", 5),
          ("Scuttle", 5),
          ("Stoneflower_Petals", 5),
          ("Trama_Root", 5),
          ("Willow_Anther", 5)
        ]}
  , { name = "Lloros Sarano",
      location = "Ald'ruhn, Temple",
      gold = 300,
      ingredients = [
          ("Ghoul_Heart", 2),
          ("Gravedust", 10),
          ("Red_Lichen", 5),
          ("Shalk_Resin", 5)
        ]}
  , { name = "Mehra Drora",
      location = "Gnisis, Temple",
      gold = 300,
      ingredients = [
          ("Bloat", 10),
          ("Dreugh_Wax", 5),
          ("Fire_Petal", 5),
          ("Ghoul_Heart", 1),
          ("Hackle-Lo_Leaf", 5),
          ("Netch_Leather", 10),
          ("Stoneflower_Petals", 10)
        ]}
  , { name = "Milar Maryon",
      location = "Tel Vos, Services Tower",
      gold = 499,
      ingredients = [
          ("Ash_Yam", 5),
          ("Bonemeal", 5),
          ("Comberry", 10),
          ("Crab_Meat", 10),
          ("Gravedust", 10),
          ("Marshmerrow", 10),
          ("Rat_Meat", 10),
          ("Wickwheat", 10)
        ]}
  , { name = "Nalcarya of White Haven",
      location = "Balmora, Nalcarya of White Haven: Fine Alchemist",
      gold = 3000,
      ingredients = [
          ("Alit_Hide", 10),
          ("Black_Anther", 10),
          ("Bloat", 10),
          ("Daedra_Skin", 1),
          ("Daedra's_Heart", 1),
          ("Diamond", 1),
          ("Fire_Salts", 5),
          ("Frost_Salts", 5),
          ("Kwama_Cuttle", 10),
          ("Muck", 10),
          ("Pearl", 3),
          ("Racer_Plumes", 10),
          ("Ruby", 3),
          ("Scales", 10),
          ("Scrap_Metal", 10),
          ("Sload_Soap", 10),
          ("Trama_Root", 10),
          ("Vampire_Dust", 1),
          ("Void_Salts", 7)
        ]}
  , { name = "Peragon",
      location = "Moonmoth Legion Fort, Interior",
      gold = 300,
      ingredients = [
          ("Coda_Flower", 5),
          ("Gold_Kanet", 5),
          ("Heather", 5),
          ("Luminous_Russula", 5),
          ("Pearl", 2),
          ("Sload_Soap", 5),
          ("Spore_Pod", 5)
        ]}
  , { name = "Pierlette Rostorard",
      location = "Sadrith Mora, Pierlette Rostorard: Apothecary",
      gold = 400,
      ingredients = [
          ("Black_Lichen", 5),
          ("Dreugh_Wax", 5),
          ("Ectoplasm", 5),
          ("Fire_Petal", 5),
          ("Kagouti_Hide", 10),
          ("Kresh_Fiber", 10),
          ("Red_Lichen", 5),
          ("Resin", 10),
          ("Roobrush", 5),
          ("Scathecraw", 10),
          ("Shalk_Resin", 5),
          ("Stoneflower_Petals", 10)
        ]}
  , { name = "Relms Gilvilo",
      location = "Vivec, Redoran Temple Shrine",
      gold = 300,
      ingredients = [
          ("Ash_Salts", 5),
          ("Black_Lichen", 5),
          ("Dreugh_Wax", 5),
          ("Fire_Salts", 5),
          ("Ghoul_Heart", 1),
          ("Roobrush", 5),
          ("Scrib_Jelly", 5)
        ]}
  , { name = "Salen Ravel",
      location = "Maar Gan, Shrine",
      gold = 200,
      ingredients = [
          ("Dreugh_Wax", 5),
          ("Ectoplasm", 5),
          ("Gravedust", 12),
          ("Kagouti_Hide", 10),
          ("Shalk_Resin", 5)
        ]}
  , { name = "Scelian Plebo",
      location = "Wolverine Hall, Imperial Shrine",
      gold = 250,
      ingredients = [
          ("Ash_Salts", 5),
          ("Bittergreen_Petals", 10),
          ("Bonemeal", 5),
          ("Chokeweed", 10),
          ("Comberry", 10),
          ("Corprus_Weepings", 5),
          ("Emerald", 2),
          ("Green_Lichen", 5),
          ("Marshmerrow", 10),
          ("Rat_Meat", 10),
          ("Saltrice", 10)
        ]}
  , { name = "Sedris Omalen",
      location = "Maar Gan, Outpost",
      gold = 200,
      ingredients = [
          ("Alit_Hide", 10),
          ("Black_Lichen", 3),
          ("Corkbulb_Root", 10),
          ("Hackle-Lo_Leaf", 5),
          ("Saltrice", 10)
        ]}
  , { name = "Somutis Vunnis",
      location = "Moonmoth Legion Fort, Interior",
      gold = 150,
      ingredients = [
          ("Ash_Salts", 5),
          ("Black_Lichen", 5),
          ("Dreugh_Wax", 5),
          ("Fire_Petal", 5),
          ("Kresh_Fiber", 5),
          ("Roobrush", 5)
        ]}
  , { name = "Telis Salvani",
      location = "Balmora, Temple",
      gold = 150,
      ingredients = [
          ("Ash_Salts", 5),
          ("Bittergreen_Petals", 5),
          ("Chokeweed", 5),
          ("Comberry", 5),
          ("Green_Lichen", 5),
          ("Netch_Leather", 5),
          ("Rat_Meat", 5)
        ]}
  , { name = "Threvul Serethi",
      location = "Sadrith Mora, Thervul\u{00a0}[sic] Serethi: Healer",
      gold = 300,
      ingredients = [
          ("Bittergreen_Petals", 10),
          ("Corprus_Weepings", 5),
          ("Hound_Meat", 10),
          ("Netch_Leather", 5),
          ("Scrib_Jelly", 5),
          ("Scuttle", 5),
          ("Small_Kwama_Egg", 10),
          ("Wickwheat", 10)
        ]}
  , { name = "Tivam Sadri",
      location = "Holamayan Monastery",
      gold = 500,
      ingredients = [
          ("Ash_Salts", 5),
          ("Corkbulb_Root", 5),
          ("Ectoplasm", 10),
          ("Ghoul_Heart", 1),
          ("Gravedust", 10),
          ("Hackle-Lo_Leaf", 10),
          ("Muck", 10),
          ("Saltrice", 10),
          ("Scrib_Jerky", 10)
        ]}
  , { name = "Tusamircil",
      location = "Wolverine Hall, Mages Guild",
      gold = 400,
      ingredients = [
          ("Ampoule_Pod", 5),
          ("Bungler's_Bane", 5),
          ("Corkbulb_Root", 10),
          ("Crab_Meat", 10),
          ("Hound_Meat", 10),
          ("Kwama_Cuttle", 10),
          ("Racer_Plumes", 10),
          ("Small_Kwama_Egg", 10),
          ("Spore_Pod", 5),
          ("Trama_Root", 10)
        ]}
  , { name = "Ulumpha gra-Sharob",
      location = "Gnisis, Fort Darius",
      gold = 300,
      ingredients = [
          ("Bonemeal", 5),
          ("Frost_Salts", 5),
          ("Hound_Meat", 10),
          ("Small_Kwama_Egg", 10)
        ]}
  , { name = "Vaval Selas",
      location = "Vivec, St. Olms Temple",
      gold = 150,
      ingredients = [
          ("Bittergreen_Petals", 5),
          ("Chokeweed", 5),
          ("Gravedust", 5),
          ("Rat_Meat", 5),
          ("Saltrice", 5),
          ("Scrib_Jelly", 5),
          ("Small_Kwama_Egg", 5)
        ]}
  , { name = "Ygfa",
      location = "Pelagiad, Fort Pelagiad",
      gold = 175,
      ingredients = [
          ("Ash_Yam", 5),
          ("Bittergreen_Petals", 5),
          ("Chokeweed", 5),
          ("Guar_Hide", 4),
          ("Marshmerrow", 5)
        ]}
  , { name = "Zanmulk Sammalamus",
      location = "Gnisis, Temple",
      gold = 150,
      ingredients = [
          ("Ash_Yam", 10),
          ("Bittergreen_Petals", 10),
          ("Hound_Meat", 10),
          ("Rat_Meat", 10),
          ("Small_Kwama_Egg", 10)
        ]}
  ]

