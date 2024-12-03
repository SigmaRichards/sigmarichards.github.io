module Data.MerchantsByIngredient exposing ( .. )

import Data.Ingredients exposing ( Ingredient, getIngredient )
import Data.Merchants exposing ( Merchant, getMerchant )

import Dict
import List

type alias MerchantIngredient = (Ingredient, List Merchant)

parseMerchantIngredient : ( String, List String ) -> MerchantIngredient
parseMerchantIngredient (si, sm) = ( getIngredient si, List.map getMerchant sm)

merchantByIngredientData : Dict.Dict String MerchantIngredient
merchantByIngredientData =
  let parser (si, sm) = (si, parseMerchantIngredient (si, sm))
  in
    Dict.fromList <| List.map parser rawData

rawData : List (String, List String)
rawData = [
  ( "Marshmerrow", [
    "Andil",
    "Chaplain Ogrul",
    "Danoso Andrano",
    "Dralval Andrano",
    "Felara Andrethi",
    "J'Rasha",
    "Milar Maryon",
    "Scelian Plebo",
    "Ygfa"
    ]),
  ( "Ash_Salts", [
    "Eldrilu Dalen",
    "Folvys Andalor",
    "Relms Gilvilo",
    "Scelian Plebo",
    "Somutis Vunnis",
    "Telis Salvani",
    "Tivam Sadri"
    ]),
  ( "Ghoul_Heart", [
    "Anis Seloth",
    "Brarayni Sarys",
    "Craetia Jullalian",
    "Lloros Sarano",
    "Mehra Drora",
    "Relms Gilvilo",
    "Tivam Sadri"
    ]),
  ( "Ruby", [
    "Anis Seloth",
    "Craetia Jullalian",
    "Daynali Dren",
    "Gils Drelas",
    "Nalcarya of White Haven"
    ]),
  ( "Fire_Petal", [
    "Cocistian Quaspus",
    "Galuro Belan",
    "Irna Maryon",
    "Mehra Drora",
    "Pierlette Rostorard",
    "Somutis Vunnis"
    ]),
  ( "Heather", [
    "Ajira",
    "Anarenen",
    "Andilu Drothan",
    "Anis Seloth",
    "Bildren Areleth",
    "Brarayni Sarys",
    "Peragon"
    ]),
  ( "Bloat", [
    "Anarenen",
    "Anis Seloth",
    "Aunius Autrus",
    "Craetia Jullalian",
    "Daynali Dren",
    "Mehra Drora",
    "Nalcarya of White Haven"
    ]),
  ( "Netch_Leather", [
    "Arnand Liric",
    "Aunius Autrus",
    "Eldrilu Dalen",
    "Mehra Drora",
    "Telis Salvani",
    "Threvul Serethi"
    ]),
  ( "Hound_Meat", [
    "Ajira",
    "Arnand Liric",
    "Cienne Sintieve",
    "Daynali Dren",
    "Ganalyn Saram",
    "Threvul Serethi",
    "Tusamircil",
    "Ulumpha gra-Sharob",
    "Zanmulk Sammalamus"
    ]),
  ( "Roobrush", [
    "Danoso Andrano",
    "Irna Maryon",
    "Pierlette Rostorard",
    "Relms Gilvilo",
    "Somutis Vunnis"
    ]),
  ( "Scrap_Metal", [
    "Andilu Drothan",
    "Anis Seloth",
    "Cienne Sintieve",
    "Daynali Dren",
    "Gils Drelas",
    "Nalcarya of White Haven"
    ]),
  ( "Luminous_Russula", [
    "Anis Seloth",
    "Ernand Thierry",
    "Jolda",
    "Peragon"
    ]),
  ( "Kagouti_Hide", [
    "Bildren Areleth",
    "Dralval Andrano",
    "Galuro Belan",
    "Guls Llervu",
    "Pierlette Rostorard",
    "Salen Ravel"
    ]),
  ( "Daedra_Skin", [
    "Anis Seloth",
    "Brarayni Sarys",
    "Garas Seloth",
    "Nalcarya of White Haven"
    ]),
  ( "Corkbulb_Root", [
    "Arrille",
    "Craetia Jullalian",
    "Eldrilu Dalen",
    "Ernand Thierry",
    "Ganalyn Saram",
    "Guls Llervu",
    "Llarara Omayn",
    "Sedris Omalen",
    "Tivam Sadri",
    "Tusamircil"
    ]),
  ( "Void_Salts", [
    "Cienne Sintieve",
    "Garas Seloth",
    "Gils Drelas",
    "Jolda",
    "Nalcarya of White Haven"
    ]),
  ( "Hypha_Facia", [
    "Anis Seloth",
    "Aurane Frernis",
    "Danoso Andrano",
    "Dralval Andrano",
    "Jolda"
    ]),
  ( "Chokeweed", [
    "Felara Andrethi",
    "J'Rasha",
    "Scelian Plebo",
    "Telis Salvani",
    "Vaval Selas",
    "Ygfa"
    ]),
  ( "Bonemeal", [
    "Anarenen",
    "Anis Seloth",
    "Garas Seloth",
    "Milar Maryon",
    "Scelian Plebo",
    "Ulumpha gra-Sharob"
    ]),
  ( "Resin", [
    "Aurane Frernis",
    "Bildren Areleth",
    "Dulian",
    "Guls Llervu",
    "Jolda",
    "Llathyno Hlaalu",
    "Pierlette Rostorard"
    ]),
  ( "Racer_Plumes", [
    "Brarayni Sarys",
    "Cienne Sintieve",
    "Craetia Jullalian",
    "Daynali Dren",
    "Garas Seloth",
    "Nalcarya of White Haven",
    "Tusamircil"
    ]),
  ( "Corprus_Weepings", [
    "Arnand Liric",
    "Aurane Frernis",
    "Folvys Andalor",
    "Scelian Plebo",
    "Threvul Serethi"
    ]),
  ( "Saltrice", [
    "Chaplain Ogrul",
    "Eldrilu Dalen",
    "Felara Andrethi",
    "Guls Llervu",
    "J'Rasha",
    "Llarara Omayn",
    "Scelian Plebo",
    "Sedris Omalen",
    "Tivam Sadri",
    "Vaval Selas"
    ]),
  ( "Black_Anther", [
    "Ajira",
    "Andil",
    "Aurane Frernis",
    "Brarayni Sarys",
    "Daynali Dren",
    "Nalcarya of White Haven"
    ]),
  ( "Violet_Coprinus", [
    "Anis Seloth",
    "Cienne Sintieve",
    "Ernand Thierry",
    "Jolda"
    ]),
  ( "Vampire_Dust", [
    "Anarenen",
    "Anis Seloth",
    "Brarayni Sarys",
    "Nalcarya of White Haven"
    ]),
  ( "Rat_Meat", [
    "Chaplain Ogrul",
    "Cocistian Quaspus",
    "Felara Andrethi",
    "Folvys Andalor",
    "Milar Maryon",
    "Scelian Plebo",
    "Telis Salvani",
    "Vaval Selas",
    "Zanmulk Sammalamus"
    ]),
  ( "Fire_Salts", [
    "Anarenen",
    "Anis Seloth",
    "Craetia Jullalian",
    "Eldrilu Dalen",
    "Gils Drelas",
    "Nalcarya of White Haven",
    "Relms Gilvilo"
    ]),
  ( "Shalk_Resin", [
    "Andil",
    "Arrille",
    "Aurane Frernis",
    "Llarara Omayn",
    "Lloros Sarano",
    "Pierlette Rostorard",
    "Salen Ravel"
    ]),
  ( "Comberry", [
    "Ajira",
    "Anarenen",
    "Andilu Drothan",
    "Felara Andrethi",
    "Milar Maryon",
    "Scelian Plebo",
    "Telis Salvani"
    ]),
  ( "Hackle-Lo_Leaf", [
    "Anis Seloth",
    "Daynali Dren",
    "Garas Seloth",
    "Gils Drelas",
    "Llarara Omayn",
    "Mehra Drora",
    "Sedris Omalen",
    "Tivam Sadri"
    ]),
  ( "Ash_Yam", [
    "Aunius Autrus",
    "Chaplain Ogrul",
    "Dulian",
    "Eldrilu Dalen",
    "J'Rasha",
    "Milar Maryon",
    "Ygfa",
    "Zanmulk Sammalamus"
    ]),
  ( "Ampoule_Pod", [
    "Cienne Sintieve",
    "Craetia Jullalian",
    "Ernand Thierry",
    "Jolda",
    "Tusamircil"
    ]),
  ( "Black_Lichen", [
    "Dralval Andrano",
    "Irna Maryon",
    "Jolda",
    "Pierlette Rostorard",
    "Relms Gilvilo",
    "Sedris Omalen",
    "Somutis Vunnis"
    ]),
  ( "Scuttle", [
    "Felara Andrethi",
    "Folvys Andalor",
    "Guls Llervu",
    "J'Rasha",
    "Llathyno Hlaalu",
    "Threvul Serethi"
    ]),
  ( "Horn_Lily_Bulb", [
    "Galsa AndranoTR"
    ]),
  ( "Sweetpulp", [
    "Galsa AndranoTR"
    ]),
  ( "Ectoplasm", [
    "Bildren Areleth",
    "Danoso Andrano",
    "Galuro Belan",
    "Llarara Omayn",
    "Pierlette Rostorard",
    "Salen Ravel",
    "Tivam Sadri"
    ]),
  ( "Small_Kwama_Egg", [
    "Ajira",
    "Cienne Sintieve",
    "Felara Andrethi",
    "J'Rasha",
    "Threvul Serethi",
    "Tusamircil",
    "Ulumpha gra-Sharob",
    "Vaval Selas",
    "Zanmulk Sammalamus"
    ]),
  ( "Guar_Hide", [
    "Aunius Autrus",
    "Eldrilu Dalen",
    "Folvys Andalor",
    "Ygfa"
    ]),
  ( "Bungler's_Bane", [
    "Danoso Andrano",
    "Dralval Andrano",
    "Ganalyn Saram",
    "Jolda",
    "Tusamircil"
    ]),
  ( "Scales", [
    "Ajira",
    "Anis Seloth",
    "Daynali Dren",
    "Ganalyn Saram",
    "Gils Drelas",
    "Nalcarya of White Haven"
    ]),
  ( "Kwama_Cuttle", [
    "Ajira",
    "Anis Seloth",
    "Cienne Sintieve",
    "Dulian",
    "Ganalyn Saram",
    "Irna Maryon",
    "Nalcarya of White Haven",
    "Tusamircil"
    ]),
  ( "Scathecraw", [
    "Andil",
    "Cocistian Quaspus",
    "Dralval Andrano",
    "Galuro Belan",
    "Guls Llervu",
    "Irna Maryon",
    "Pierlette Rostorard"
    ]),
  ( "Scrib_Jelly", [
    "Arnand Liric",
    "Eldrilu Dalen",
    "Folvys Andalor",
    "Llathyno Hlaalu",
    "Relms Gilvilo",
    "Threvul Serethi",
    "Vaval Selas"
    ]),
  ( "Red_Lichen", [
    "Aurane Frernis",
    "Dralval Andrano",
    "Irna Maryon",
    "Lloros Sarano",
    "Pierlette Rostorard"
    ]),
  ( "Pearl", [
    "Anis Seloth",
    "Craetia Jullalian",
    "Danoso Andrano",
    "Garas Seloth",
    "Gils Drelas",
    "Jolda",
    "Nalcarya of White Haven",
    "Peragon"
    ]),
  ( "Muck", [
    "Andilu Drothan",
    "Anis Seloth",
    "Brarayni Sarys",
    "Dulian",
    "Llathyno Hlaalu",
    "Nalcarya of White Haven",
    "Tivam Sadri"
    ]),
  ( "Green_Lichen", [
    "Aurane Frernis",
    "Dralval Andrano",
    "Irna Maryon",
    "Scelian Plebo",
    "Telis Salvani"
    ]),
  ( "Emerald", [
    "Cocistian Quaspus",
    "Craetia Jullalian",
    "Folvys Andalor",
    "Irna Maryon",
    "Scelian Plebo"
    ]),
  ( "Gravedust", [
    "Arnand Liric",
    "Aunius Autrus",
    "Llathyno Hlaalu",
    "Lloros Sarano",
    "Milar Maryon",
    "Salen Ravel",
    "Tivam Sadri",
    "Vaval Selas"
    ]),
  ( "Dreugh_Wax", [
    "Danoso Andrano",
    "Jolda",
    "Mehra Drora",
    "Pierlette Rostorard",
    "Relms Gilvilo",
    "Salen Ravel",
    "Somutis Vunnis"
    ]),
  ( "Nirthfly_Stalks", [
    "Galsa AndranoTR"
    ]),
  ( "Gold_Kanet", [
    "Andil",
    "Andilu Drothan",
    "Daynali Dren",
    "Gils Drelas",
    "Peragon"
    ]),
  ( "Bittergreen_Petals", [
    "Bildren Areleth",
    "Cocistian Quaspus",
    "Scelian Plebo",
    "Telis Salvani",
    "Threvul Serethi",
    "Vaval Selas",
    "Ygfa",
    "Zanmulk Sammalamus"
    ]),
  ( "Alit_Hide", [
    "Anis Seloth",
    "Craetia Jullalian",
    "Daynali Dren",
    "Ernand Thierry",
    "Nalcarya of White Haven",
    "Sedris Omalen"
    ]),
  ( "Daedra's_Heart", [
    "Anis Seloth",
    "Craetia Jullalian",
    "Gils Drelas",
    "Nalcarya of White Haven"
    ]),
  ( "Coda_Flower", [
    "Anis Seloth",
    "Aurane Frernis",
    "Brarayni Sarys",
    "Cienne Sintieve",
    "Danoso Andrano",
    "Ernand Thierry",
    "Peragon"
    ]),
  ( "Willow_Anther", [
    "Ajira",
    "Anis Seloth",
    "Daynali Dren",
    "Dulian",
    "Ganalyn Saram",
    "Gils Drelas",
    "Llathyno Hlaalu"
    ]),
  ( "Scrib_Jerky", [
    "Arrille",
    "Aunius Autrus",
    "Dulian",
    "Eldrilu Dalen",
    "Folvys Andalor",
    "Galsa AndranoTR",
    "Llarara Omayn",
    "Tivam Sadri"
    ]),
  ( "Sload_Soap", [
    "Andilu Drothan",
    "Anis Seloth",
    "Brarayni Sarys",
    "Nalcarya of White Haven",
    "Peragon"
    ]),
  ( "Trama_Root", [
    "Andilu Drothan",
    "Anis Seloth",
    "Daynali Dren",
    "Dulian",
    "Gils Drelas",
    "Llathyno Hlaalu",
    "Nalcarya of White Haven",
    "Tusamircil"
    ]),
  ( "Scamp_Skin", [
    "Arnand Liric",
    "Aunius Autrus",
    "Felara Andrethi",
    "Folvys Andalor",
    "J'Rasha"
    ]),
  ( "Kresh_Fiber", [
    "Andil",
    "Bildren Areleth",
    "Cocistian Quaspus",
    "Galuro Belan",
    "Llathyno Hlaalu",
    "Pierlette Rostorard",
    "Somutis Vunnis"
    ]),
  ( "Wickwheat", [
    "Anis Seloth",
    "Chaplain Ogrul",
    "Danoso Andrano",
    "Dralval Andrano",
    "Garas Seloth",
    "Irna Maryon",
    "Llarara Omayn",
    "Milar Maryon",
    "Threvul Serethi"
    ]),
  ( "Spore_Pod", [
    "Brarayni Sarys",
    "Cienne Sintieve",
    "Danoso Andrano",
    "Ernand Thierry",
    "Ganalyn Saram",
    "Peragon",
    "Tusamircil"
    ]),
  ( "Frost_Salts", [
    "Anis Seloth",
    "Cienne Sintieve",
    "Craetia Jullalian",
    "Daynali Dren",
    "Gils Drelas",
    "Nalcarya of White Haven",
    "Ulumpha gra-Sharob"
    ]),
  ( "Stoneflower_Petals", [
    "Andil",
    "Bildren Areleth",
    "Cocistian Quaspus",
    "Galuro Belan",
    "Llathyno Hlaalu",
    "Mehra Drora",
    "Pierlette Rostorard"
    ]),
  ( "Diamond", [
    "Anarenen",
    "Anis Seloth",
    "Brarayni Sarys",
    "Craetia Jullalian",
    "Daynali Dren",
    "Nalcarya of White Haven"
    ]),
  ( "Crab_Meat", [
    "Ajira",
    "Anarenen",
    "Chaplain Ogrul",
    "Craetia Jullalian",
    "Daynali Dren",
    "Milar Maryon",
    "Tusamircil"
    ])]
