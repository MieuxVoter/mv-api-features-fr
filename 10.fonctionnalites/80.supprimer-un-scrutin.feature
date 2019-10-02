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



Scénario: Suppression d'un scrutin sans aucun vote
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
