#language: fr
@fr
Fonctionnalité: Créer un scrutin au jugement majoritaire
  Dans le but de décider collectivement
  En tant que collectif démocratique connecté
  Nous souhaitons créer un scrutin au jugement majoritaire



Scénario: Créer un scrutin au jugement majoritaire
  Étant donné un citoyen surnommé Chinao
#      Sachant qu'il ne devrait y avoir aucun scrutin au jugement majoritaire dans la base de données
        Quand Chinao crée un scrutin au jugement majoritaire comme suit:
          """
          titre: _Pain au chocolat_ ou _Chocolatine_?
          options:
            - Pain au chocolat
            - Chocolatine
            - Obi-Wan Kenobi
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
        Quand Chinao vote sur le scrutin au jugement majoritaire titré "_Pain au chocolat_ ou _Chocolatine_?":
          """
          Pain au chocolat: bien
          Chocolatine: assez bien
          Obi-Wan Kenobi: excellent
          """
           Et Chinao affiche les trois dernières transactions
        Alors Chinao devrait maintenant avoir trois votes sur le scrutin titré "_Pain au chocolat_ ou _Chocolatine_?"
