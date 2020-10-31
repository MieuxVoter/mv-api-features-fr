#language: fr
@fr
Fonctionnalité: Créer un compte utilisateur
  Dans le but d'administrer mes scrutins
  En tant qu'utilisatrice
  Je veux créer un compte


Règle: Le courriel doit être unique
# → Permet la réinitialisation de mot de passe par courriel

#Règle: Le mot de passe doit comporter au moins ?? caractères
# ou (?)
#Règle: La phrase secrète doit comporter au moins ?? caractères


Scénario: Créer un compte utilisateur
  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données


Scénario: Créer un compte utilisateur avec courriel
  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données


Scénario: Échouer à créer un compte utilisateur avec un courriel existant
  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "hUM4n1sm3"
  Quand Macron tente de créer un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "1mP0$T3uR"
  Alors Macron devrait échouer


Scénario: Échouer à créer un compte utilisateur avec un nom d'utilisateur trop long
Scénario: Échouer à créer un compte utilisateur avec un courriel trop long
Scénario: Échouer à créer un compte utilisateur avec un courriel invalide
Scénario: Échouer à créer un compte utilisateur avec un mot de passe trop long
