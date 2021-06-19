#language: fr
@fr
Fonctionnalité: Préparer une démonstration
  Dans le but de ?
  En tant que développeur
  Je souhaite remplir la base de données


@fixture-01
Scénario: Développement d'un client
  Étant donné une citoyenne nommée Domi
           Et une citoyenne nommée Stef
           Et un citoyen nommé John
           Et une citoyenne nommée Lucy
           Et un citoyen nommé Mike
           Et une citoyenne nommée Ploy
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: Scrutin A
          propositions:
            - Proposition A1
            - Proposition A2
          mentions:
            - Non
            - Oui
          """
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: Scrutin B
          propositions:
            - Proposition B1
            - Proposition B2
          mentions:
            - Non
            - Bof
            - Oui
          """
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: Tonight's Dinner
          propositions:
            - Pizza
            - Pasta
            - Ratatouille
            - Salad
            - Soup
          mentions:
            - Reject
            - Poor
            - Passable
            - Good
            - Very Good
            - Excellent
          """
           Et Domi vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Good
          Pasta: Passable
          Ratatouille: Excellent
          Salad: Poor
          Soup: Good
          """
           Et Stef vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Good
          Pasta: Poor
          Ratatouille: Good
          Salad: Good
          Soup: Good
          """
           Et John vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Good
          Pasta: Passable
          Ratatouille: Good
          Salad: Poor
          Soup: Good
          """
           Et Lucy vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Good
          Pasta: Excellent
          Ratatouille: Excellent
          Salad: Reject
          Soup: Good
          """
           Et Mike vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Good
          Pasta: Poor
          Ratatouille: Excellent
          Salad: Excellent
          Soup: Excellent
          """
           Et Ploy vote sur le scrutin de "Tonight's Dinner":
          """
          Pizza: Excellent
          Pasta: Passable
          Ratatouille: Poor
          Salad: Poor
          Soup: Good
          """