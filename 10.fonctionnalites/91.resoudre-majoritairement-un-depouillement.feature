#language: fr
@fr
Fonctionnalité: Résoudre majoritairement un dépouillement
  Dans le but de connaître le rang des propositions
  En tant que détenteur⋅e du dépouillement d'un scrutin
  Je veux résoudre ce dépouillement


Règle: S'authentifier n'est pas nécessaire pour résoudre un dépouillement


@wip
Scénario: Résoudre un dépouillement

  Étant donné un visiteur nommé Paul Bourgine
  Quand Paul Bourgine télécharge le fichier 0-2-5-2-4_2-1-4-1-5_0-1-6-3-3.json
  Alors Paul Bourgine devrait réussir
  Et Paul Bourgine affiche la transaction

