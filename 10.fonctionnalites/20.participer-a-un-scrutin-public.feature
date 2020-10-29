#language: fr
@fr
Fonctionnalité: Participer à un scrutin public
  Dans le but d'exercer mon devoir
  Ainsi que de préserver mes droits
  Ou simplement de participer à un choix collectif
  En tant que citoyen⋅ne participant⋅e
  Je souhaite parfois décider avec un scrutin au jugement majoritaire



@wip2
Scénario: Voter au jugement majoritaire
  Étant donné une visiteuse nommée Martine
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
#        Alors Martine devrait avoir quatre votes sur le scrutin intitulé "Mes Philosophies"

        Alors le dépouillement standard du scrutin de "Mes Philosophies" devrait être:
          """
          Vivre:      peu prioritaire
          Travailler: ultra prioritaire
          Aimer:      très prioritaire
          """
