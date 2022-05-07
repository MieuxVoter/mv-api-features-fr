#language: fr
@fr
Fonctionnalité: Se connecter avec un compte utilisateur
  Dans le but d'administrer mes scrutins et mon compte
  En tant qu'utilisatrice
  Je veux me connecter à mon compte


Scénario: Obtenir un jeton de connexion

  #Étant donné un citoyen nommé Marcel avec le mot de passe "hUM4n1sm3"
  # going the long way for now
  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné un visiteur nommé Marcel
     Et Marcel crée un compte utilisateur avec le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données
  #####################################################################
  Quand Marcel tente d'obtenir un jeton avec le mot de passe "hUM4n1sm3"
  Alors Marcel devrait réussir
     #Et la réponse à Marcel devrait contenir la clef "token"
     Et Marcel affiche la transaction


# Ce scénario est indispensable car le jeton de connexion ci-dessus ne contient pas l'identifiant de l'utilisateur.
Scénario: Obtenir des informations sur moi-même

  Étant donné une citoyenne nommée Caroline
  Quand Caroline tente d'obtenir des informations sur elle-même
  Alors Caroline devrait réussir
     Et Caroline affiche la transaction
