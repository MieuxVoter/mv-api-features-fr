#language: fr
@fr
Fonctionnalité: Créer un scrutin au jugement majoritaire
  Dans le but de décider collectivement
  En tant que collectif démocratique connecté
  Nous souhaitons créer un scrutin au jugement majoritaire

  Dans le but de s'organiser pour ce week-end
  En tant que groupe d'amis
  Nous souhaitons créer un scrutin au jugement majoritaire


Règle: Un scrutin requiert un sujet
Règle: Un scrutin requiert au moins deux propositions
Règle: Un scrutin requiert au moins deux mentions


Scénario: Créer un scrutin au jugement majoritaire
  Étant donné un citoyen surnommé Chinao
#      Sachant qu'il ne devrait y avoir aucun scrutin au jugement majoritaire dans la base de données
        Quand Chinao crée un scrutin au jugement majoritaire comme suit:
          """
          sujet: Repas de samedi
          propositions:
            - Barbecue vegan
            - Lasagnes
            - Aubergines à la japonaise
          mentions:
            - Non merci
            - Mouais
            - Oui
            - Oui, oui, oui!
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
           Et le scrutin intitulé "Repas de samedi" devrait avoir trois propositions
           Et le scrutin intitulé "Repas de samedi" devrait avoir quatre mentions
#           Et Chinao affiche la transaction



Scénario: Échouer à créer un scrutin avec trop peu de mentions
  Étant donné une citoyenne surnommée Paresse
        Quand Paresse tente de créer un scrutin au jugement majoritaire comme suit:
          """
          sujet: Mes activités favorites
          propositions:
            - Dormir
            - Faire la sieste
          mentions:
            - Accepter
          """
        Alors Paresse devrait échouer

