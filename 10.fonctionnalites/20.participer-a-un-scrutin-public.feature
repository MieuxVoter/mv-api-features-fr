#language: fr
@fr
Fonctionnalité: Participer à un scrutin public
  Dans le but d'exercer mon devoir
  Ainsi que de préserver mes droits
  Ou simplement de participer à un choix collectif
  En tant que citoyen⋅ne participant⋅e
  Je souhaite parfois décider avec un scrutin au jugement majoritaire


Règle: Les jugements sont immutables
Règle: On change d'avis en soumettant un nouveau jugement


Scénario: Voter au jugement majoritaire
  Étant donné une citoyenne nommée Martine
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: Mes Philosophies
          propositions:
            - Vivre
            - Travailler
            - Aimer
          mentions:
            - pas prioritaire
            - peu prioritaire
            - prioritaire
            - très prioritaire
            - ultra prioritaire
          """
        Quand Martine vote sur le scrutin de "Mes Philosophies":
          """
          Vivre:      peu prioritaire
          Travailler: ultra prioritaire
          Aimer:      très prioritaire
          """

           Et Martine affiche la transaction
#        Alors Martine devrait avoir trois votes sur le scrutin intitulé "Mes Philosophies"

        Alors le dépouillement standard du scrutin de "Mes Philosophies" devrait être:
          """
          Vivre:      peu prioritaire
          Travailler: ultra prioritaire
          Aimer:      très prioritaire
          """



Scénario: Soumettre un nouveau jugement
  Étant donné une citoyenne nommée Girouette
           Et un scrutin au jugement majoritaire comme suit:
          """
          accès: public
          sujet: J'aime…
          propositions:
            - le vent du Sud
            - le petit vent frais
            - le mistral
          mentions:
            - pas du tout
            - un peu
            - à la folie
          """
        Quand Girouette vote sur le scrutin assujettissant "J'aime…":
          """
          le vent du Sud: pas du tout
          le petit vent frais: pas du tout
          le mistral: à la folie
          """
        Alors le dépouillement standard du scrutin de "J'aime…" devrait être:
          """
          le vent du Sud: pas du tout
          le petit vent frais: pas du tout
          le mistral: à la folie
          """
         Mais Girouette change d'avis
        Alors Girouette vote sur le scrutin assujettissant "J'aime…":
          """
          le vent du Sud: à la folie
          """
        Alors le dépouillement standard du scrutin de "J'aime…" devrait être:
          """
          le vent du Sud: à la folie
          le petit vent frais: pas du tout
          le mistral: à la folie
          """
