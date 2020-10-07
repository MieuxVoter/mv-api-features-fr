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
Règle: Un scrutin accepte au maximum seize mentions


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
#           Et Paresse affiche la transaction
           Et il ne devrait encore y avoir aucun scrutin dans la base de données



Scénario: Échouer à créer un scrutin avec trop de mentions (17 mentions)
  Étant donné une citoyenne enthousiaste surnommée Perle
        Quand Perle tente de créer un scrutin comme suit:
          """
          sujet: Scrutin trop précis
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Mention A
            - Mention B
            - Mention C
            - Mention E
            - Mention D
            - Mention F
            - Mention G
            - Mention H
            - Mention I
            - Mention J
            - Mention K
            - Mention L
            - Mention M
            - Mention N
            - Mention O
            - Mention P
            - Mention Q
          """
        Alors Perle devrait échouer
#           Et Perle affiche la transaction
           Et il ne devrait encore y avoir aucun scrutin dans la base de données

