#language: fr
@fr
Fonctionnalité: Voir les scrutins dont je suis l'auteure
  Dans le but de présenter les derniers scrutins que j'ai créé
  En tant qu'utilisateure
  Je souhaite voir les scrutins dont je suis l'auteure



Scénario: Voir mes propres scrutins
  Étant donné un utilisateur nommé Eban
           Et un scrutin au jugement majoritaire comme suit:
          """
          auteur: Eban
          accès: privé
          sujet: Scrutin A
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          """
        Quand Eban liste ses propres scrutins
        Alors Eban devrait réussir
           Et Eban devrait voir un scrutin


