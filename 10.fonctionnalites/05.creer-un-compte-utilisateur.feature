#language: fr
@fr
Fonctionnalité: Créer un compte utilisateur
  Dans le but d'administrer mes scrutins
  En tant qu'utilisatrice
  Je veux créer un compte


Règle: Le courriel est optionnel
Règle: Le courriel doit être unique
# → Permet la réinitialisation de mot de passe par courriel


Règle: Le nom d'utilisateur⋅e est obligatoire
Règle: Un nom d'utilisateur⋅e est créé automatiquement si aucun n'est fourni
Règle: Le nom d'utilisateur⋅e doit être unique

#Règle: Le mot de passe doit comporter au moins ?? caractères
# ou (?)
#Règle: La phrase secrète doit comporter au moins ?? caractères



Scénario: Créer un compte utilisateur

  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le mot de passe "hUM4n1sm3"
  Alors il devrait maintenant y avoir un utilisateur dans la base de données



Scénario: Créer un compte utilisateur sans courriel

  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné une visiteuse nommée Adèle
  Quand Adèle crée un compte utilisateur comme suit:
    """
    username: Adèle
    password: fuliginous⋅sesame⋅burger⋅freegan⋅alpine
    """
  Alors il devrait maintenant y avoir un⋅e utilisateur⋅e dans la base de données
  Étant donné une visiteuse nommée Brigitte
  Quand Brigitte crée un compte utilisateur comme suit:
    """
    username: Brigitte
    password: fire-life-yarn-baby-star
    """
  Alors il devrait maintenant y avoir deux utilisatrices dans la base de données


Scénario: Créer un compte utilisateur avec un nom généré automatiquement

  Sachant qu'il ne devrait y avoir aucun utilisateur dans la base de données
  Étant donné une visiteuse nommée Solenn
  Quand Solenn crée un compte utilisateur comme suit:
    """
    password: polysemic-platypus-yggdrâsil-nonchalant
    """
     Et Solenn affiche la transaction
  Alors il devrait maintenant y avoir une utilisatrice dans la base de données


Scénario: Échouer à créer un compte avec un nom d'utilisateur déjà pris

  Étant donnée une visiteuse nommée Clotilde Bossoit
     Et une visiteuse nommée Clotilde Egojoly
  Quand Clotilde Bossoit crée un compte utilisatrice comme suit:
    """
    username: Clotilde
    password: epic-fantasy-playful-trouble-¿'
    """
  Alors Clotilde Bossoit devrait réussir
  Quand Clotilde Egojoly tente de créer un compte utilisatrice comme suit:
    """
    username: Clotilde
    password: liquid-philology-holistic-sherpa-spring
    """
  Alors Clotilde Egojoly devrait échouer
#     Et Clotilde Egojoly affiche la transaction



Scénario: Échouer à créer un compte utilisateur avec un courriel existant

  Étant donné un visiteur nommé Marcel
  Quand Marcel crée un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "hUM4n1sm3"
  Quand Macron tente de créer un compte utilisateur avec le courriel "marcel@gj.fr" et le mot de passe "1mP0$T3uR"
  Alors Macron devrait échouer


Scénario: Échouer à créer un compte utilisateur avec un nom d'utilisateur trop long
Scénario: Échouer à créer un compte utilisateur avec un courriel trop long
Scénario: Échouer à créer un compte utilisateur avec un courriel invalide
Scénario: Échouer à créer un compte utilisateur avec un mot de passe trop long
