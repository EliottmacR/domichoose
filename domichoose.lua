function init_domichoose()

  dominion = {}
  
  add_base_cards()
  
  dominion.card_sets = {}
  
  add_vanilla_cards()
  add_prosperite_cards()
  add_alchimie_cards()
  
  local choosen = choose_cards({
    {from = "vanilla", n = 4},
    {from = "alchimie", n = 3},
    {from = "prosperité", n = 3},
  })
  
  for i, c in pairs(choosen) do
    if is_in(c, dominion.card_sets["prosperité"]) then
      need_plat = true
      if is_in(c, c_b) then
        need_c_b = true
      end
      if c == "route commerciale" then
        need_r_c_b = true
      end
    end
    
    if is_in(c, dominion.card_sets["alchimie"]) then
      if is_in(c, p) then
        need_p = true
      end
    end
  end
  
  local tab = {}
  
  for i, c in pairs( dominion.base) do
    add(tab, c)
  end
  
  if need_plat then add(tab, "platine") end
  if need_p then add(tab, "potion") end
  
  write("Voici les cartes choisies: ")
  
  for i, c in pairs(choosen) do 
    write(c)
  end
  
  write("")
  
  if need_c_b then write("Vous aurez besoin de cartons à points!") end
  if need_r_c_b then write("Vous aurez besoin du carton de route commerciale!") end
  
end

function add_base_cards()
  
  dominion.base = {
    "cuivre",
    "argent",
    "or",
    "domaine",
    "duché",
    "province",
    "malédiction",
    "rebut"
  }
  
end

function add_vanilla_cards()
  dominion.card_sets["vanilla"] = {
    "douves", "atelier", "aventurier", "bibliothèque", "bucheron", "bureacrate", "cave", "chambre du conseil", "chancelier",
    "chapelle", "espion", "festin", "festival", "forgeron", "laboratoire", "marché", "milice", "mine", "preteur sur gage",
    "renovation", "salle du trone", "sorcière", "village", "voleur", "jardins"
  }
end

function add_prosperite_cards()
  dominion.card_sets["prosperité"] = {
    "mirador", "agrandissement", "banque", "bureau de comptabilité", "carriere", "chambre forte", "charlatan", "colporteur",
    "contrebande", "cour du roi", "entreprise risquée", "évèque", "fiers-a-bras", "forge", "foule", "grand marché",
    "hotel de la monnaie", "magot", "monument", "pret", "route commerciale", "sceau royal", "talisman", "village ouvrier",
    "ville",
  }
  
  c_b = { "évèque", "fiers-a-bras"}
end

function add_alchimie_cards()
  dominion.card_sets["alchimie"] = {
    "alchimiste"," apothicaire", "apprenti", "bassin divinatoire", "familier", "golem", "herboriste", "pierre philosophale",
    "possession", "transmutation", "université", "vignoble"
  }
  
  p = {
    "alchimiste"," apothicaire", "bassin divinatoire", "familier", "golem", "pierre philosophale",
    "possession", "transmutation", "université", "vignoble"
  }
end

function create_set(name_set, names)
  local s = {
    name = name_set or "",
    cards = {}
  }
  for i = 1, #names do 
    add_card_to_set(s, names[i])
  end
  return s
end

function add_card_to_set(set, name)
  add(set.cards, {name = name})
end

function choose_cards(tab)
  local total = 10
  local choosen = {}
  for i, t_c in pairs(tab) do
    local to_draw = min(t_c.n, total)
    for i, c in pairs(pick_distinct( to_draw, dominion.card_sets[t_c.from] )) do
      add(choosen, c)
    end
    total = total - to_draw
    if total == 0 then return choosen end
  end
  return choosen
end

function pick(tab)
  local i = irnd(#tab) + 1
  return tab[i], i
end


function add(...)
  return table.insert(...)
end




