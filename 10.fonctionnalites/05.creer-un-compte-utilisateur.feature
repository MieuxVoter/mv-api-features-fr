#language: fr
@fr
Fonctionnalité: Créer un compte utilisateur
  Dans le but d'administrer mes sondages
  En tant qu'utilisateur intensif
  Je veux créer un compte


Règle: Les courriels doivent être uniques


Scénario: Créer un compte utilisateur
  Alors il ne devrait y avoir aucun utilisateur dans la base de données
  Quand Marcel crée un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données


Scénario: Échouer à créer un compte utilisateur avec un courriel existant
  Quand Marcel crée un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "hUM4n1sm3"
  Quand Macron tente de créer un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "1mP0$T3uR"
  Alors Macron devrait échouer
