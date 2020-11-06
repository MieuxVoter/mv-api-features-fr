#language: fr
@fr
Fonctionnalité: Partager un scrutin au jugement majoritaire
  Dans le but de décider collectivement
  En tant que collectif démocratique connecté
  Nous souhaitons partager un scrutin au jugement majoritaire



Scénario: Partager un lien court
  Étant donné un visiteur nommé Pierre-Louis
  Étant donné un scrutin au jugement majoritaire comme suit:
          """
          uuid: 6d95c98b-771a-4495-b9f8-75f88d090435
          slug: scrutin-securite
          sujet: La sécurité des scrutins
          propositions:
            - Par session
            - Par invitation seulement
          mentions:
            - Pas sécurisé
            - Peu sécurisé
            - Assez sécurisé
            - Très sécurisé
          """
        Alors il devrait maintenant y avoir un scrutin au jugement majoritaire dans la base de données
           Et le scrutin intitulé "La sécurité des scrutins" devrait avoir deux propositions
           Et le scrutin intitulé "La sécurité des scrutins" devrait avoir quatre mentions
        Quand Pierre-Louis tente de voir le scrutin identifié "6d95c98b-771a-4495-b9f8-75f88d090435"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d95c98b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d9-5c9-8b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "6d9-5c-98b"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "scrutin-securite"
        Alors Pierre-Louis devrait réussir
        Quand Pierre-Louis tente de voir le scrutin identifié "00000000"
        Alors Pierre-Louis devrait échouer
