#language: fr
@fr
@wip
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



Scénario: Suppression de mon scrutin sans aucun vote
  Étant donné un citoyen nommé Léon
           Et Léon crée un scrutin au jugement majoritaire comme suit:
          """
          titre: Test
          options:
            - sdf
            - fgh
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
        Quand Léon tente de supprimer le scrutin titré "Test"
        Alors Léon devrait réussir
           Et il ne devrait maintenant y avoir aucun scrutin au jugement majoritaire dans la base de données



Scénario: Suppression d'un scrutin ayant des votes par un modérateur
  Étant donné un modérateur nommé Georges
           Et un citoyen nommé Spammeur
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: BuY mY Pr0dUcT
          options:
            - C4C4
            - $3×
          """
           Et Spammeur vote sur le scrutin titré "BuY mY Pr0dUcT":
          """
          C4C4 : à rejeter
          $3×  : passable
          """
        Quand Georges tente de supprimer le scrutin titré "BuY mY Pr0dUcT"
        Alors Georges devrait réussir
           Et il ne devrait maintenant y avoir aucun scrutin au jugement majoritaire dans la base de données



Scénario: Échec de la suppression d'un scrutin si on a aucun droit particulier dessus
  Étant donné un citoyen nommé Troll
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Les produits de la France, moralement
          options:
            - La fission nucléaire
            - Les armes
            - Les alcools
            - Les fromages
            - Les logiciels
            - La commune
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
        Quand Troll tente de supprimer le scrutin titré "Les produits de la France, moralement"
        Alors Troll devrait échouer
           Et il devrait encore y avoir un scrutin au jugement majoritaire dans la base de données
