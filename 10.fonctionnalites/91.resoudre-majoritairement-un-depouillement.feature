#language: fr
@fr
Fonctionnalité: Résoudre majoritairement un dépouillement
  Dans le but de connaître le rang des propositions
  En tant que détenteur⋅e du dépouillement d'un scrutin
  Je veux résoudre ce dépouillement


Règle: S'authentifier n'est pas nécessaire pour résoudre un dépouillement


Scénario: Résoudre un dépouillement

  Étant donné un visiteur nommé Paul Bourgine
  Quand Paul Bourgine télécharge le fichier 0-2-5-2-4_2-1-4-1-5_0-1-6-3-3.json
  Alors Paul Bourgine devrait réussir
  Et la réponse à Paul Bourgine devrait comporter:
  """
  proposals:
  - proposal: 0
    rank: 2
    tally: [0, 2, 5, 2, 4]
    median: 2
  - proposal: 1
    rank: 1
    tally: [2, 1, 4, 1, 5]
    median: 2
  - proposal: 2
    rank: 3
    tally: [0, 1, 6, 3, 3]
    median: 2
  """


@wip
@vigil
Scénario: Donner n'importe quoi comme dépouillement

  Étant donné un visiteur nommé Imran Tierce
  Quand Imran Tierce tente de télécharger le fichier not-a-tally-lol.json
  Alors Imran Tierce devrait échouer
  Alors Imran Tierce devrait recevoir un code 404
  Alors Imran Tierce affiche la transaction

