#language: fr
@fr
Fonctionnalité: Se connecter avec un compte utilisateur
  Dans le but d'administrer mes scrutins
  En tant qu'utilisatrice
  Je veux me connecter à mon compte


Scénario: Obtenir un jeton de connexion
  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données
  Quand Marcel tente d'obtenir un jeton avec le mot de passe "hUM4n1sm3"
  Alors Marcel devrait réussir
     Et Marcel affiche la transaction

