#language: fr
@fr
Fonctionnalité: Supprimer un scrutin au jugement majoritaire (liquide)
  Dans le but de modérer un comportement abusif
  En tant que modératrice
  Je souhaite supprimer un scrutin
  Dans le but d'annuler un scrutin
  En tant qu'auteur du scrutin
  Je souhaite supprimer un scrutin



Règle: On ne peut pas supprimer un scrutin sans en avoir le droit
Règle: Les administrateur⋅es ont le droit de supprimer des scrutins
Règle: Les modérateur⋅es ont le droit de supprimer des scrutins



Scénario: Suppression de mon scrutin de test sans aucun vote
  Étant donné un citoyen nommé Léon
           Et Léon crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Test
          propositions:
            - sdf
            - fgh
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
        Quand Léon tente de supprimer le scrutin titré "Test"
        Alors Léon devrait réussir
           Et il ne devrait maintenant y avoir aucun scrutin au jugement majoritaire dans la base de données



#Scénario: Suppression d'un scrutin ayant des votes par un modérateur
#  Étant donné un modérateur nommé Georges
#           Et un citoyen nommé Spammeur
#           Et un scrutin au jugement majoritaire comme suit:
#          """
#          titre: BuY mY Pr0dUcT
#          candidats:
#            - C4C4
#            - $3×
#          """
#           Et Spammeur vote sur le scrutin titré "BuY mY Pr0dUcT":
#          """
#          C4C4 : à rejeter
#          $3×  : passable
#          """
#        Quand Georges tente de supprimer le scrutin titré "BuY mY Pr0dUcT"
#        Alors Georges devrait réussir
#           Et il ne devrait maintenant y avoir aucun scrutin au jugement majoritaire dans la base de données



Scénario: Échec de la suppression d'un scrutin si on a aucun droit particulier dessus
  Étant donné un citoyen nommé Troll
           Et un scrutin au jugement majoritaire comme suit:
          """
          sujet: Les produits de la France, moralement
          propositions:
            - La fission nucléaire
            - Les armes
            - Les avions
            - Les alcools
            - Les fromages
            - Les logiciels
            - La commune
            - Le Jugement Majoritaire
          mentions:
            - obscène
            - dérangeant
            - passable
            - bien
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
        Quand Troll tente de supprimer le scrutin titré "Les produits de la France, moralement"
        Alors Troll devrait échouer
           Et il devrait encore y avoir un scrutin au jugement majoritaire dans la base de données



Scénario: Échec de la suppression de mon scrutin car il contient des votes
  Étant donné un citoyen nommé Iflop
           Et un citoyenne nommée Doxa
           Et Iflop crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: L'éthique des entreprises
          propositions:
            - Monsanto
            - Total
            - Mobicoop
          mentions:
            - à rejeter
            - insuffisant
            - passable
            - assez bien
            - bien
            - très bien
            - excellent
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
           Et Doxa vote sur le scrutin titré "L'éthique des entreprises":
          """
          Monsanto : à rejeter
          Total    : insuffixant
          Mobicoop : très bien
          """
         Mais Iflop n'aime pas ça
        Alors Iflop tente de supprimer le scrutin titré "L'éthique des entreprises"
         Mais Iflop devrait échouer
           Et il devrait encore y avoir un scrutin au jugement majoritaire dans la base de données
