#language: fr
@fr
@wip
Fonctionnalité: Générer le Profil de Mérite d'un scrutin en SVG
  Dans le but de …
  En tant que participant à un scrutin
  Je veux observer son profil de mérite


Scénario: Générer un SVG de profil de mérite d'un scrutin

  Étant donné un visiteur nommé Valentin
  Quand Valentin génère un SVG de profil de mérite d'un scrutin comme suit:
  """
  tally: "[0, 2, 5, 2, 4], [2, 1, 4, 1, 5], [0, 1, 6, 3, 3]"
  """
#  dépouillement:
#    - [0, 2, 5]
#    - [0, 2, 5]
#  sujet: …
#  mentions:
#    - à rejeter
#    - passable
#    - bien
#  propositions:
#    - …
  Et Valentin affiche la transaction
  Alors Valentin devrait réussir
#  Alors Valentin devrait recevoir:
#  """
#  ???
#  """



Scénario: Utiliser une autre syntaxe comme ?tally=0,2,5/4,1,2

  Étant donné un visiteur nommé Valentin
  Quand Valentin génère un SVG de profil de mérite d'un scrutin comme suit:
  """
  tally: "0, 2, 5, 2, 4/2, 1, 4, 1, 5 / 0,1,6,3,3"
  """
  Et Valentin affiche la transaction
  Alors Valentin devrait réussir



Scénario: Utiliser la syntaxe de tableaux `?tally[0]=0,2,5&tally[1]=4,1,2`

  Étant donné une visiteuse nommée Capucine
  Quand Capucine génère un SVG de profil de mérite d'un scrutin comme suit:
  """
  tally:
    - "0, 2, 5, 2, 4"
    - "2, 1, 4, 1, 5"
    - "0, 1, 6, 3, 3"
  """
  Et Capucine affiche la transaction
  Alors Capucine devrait réussir



Scénario: Utiliser la syntaxe multidimensionnelle `?tally[0,0]=0&tally[0,1]=2 …`

  Étant donné une visiteuse nommée Capucine
  Quand Capucine génère un SVG de profil de mérite d'un scrutin comme suit:
  """
  tally:
    - [0, 2, 5, 2, 4]
    - [2, 1, 4, 1, 5]
    - [0, 1, 6, 3, 3]
  """
  Et Capucine affiche la transaction
  Alors Capucine devrait réussir