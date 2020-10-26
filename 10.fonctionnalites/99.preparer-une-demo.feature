#language: fr
@fr
Fonctionnalité: Préparer une démonstration
  Dans le but de ?
  En tant que développeur
  Je souhaite remplir la base de données


@fixture-01
Scénario: Développement d'un client
  Étant donné un citoyen nommé Domi
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
