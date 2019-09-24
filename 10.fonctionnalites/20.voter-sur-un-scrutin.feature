#language: fr
@fr
Fonctionnalité: Voter sur un scrutin au jugement majoritaire
  Dans le but d'exercer mon devoir
  Ainsi que de préserver mes droits
  En tant que citoyen⋅ne
  Je souhaite parfois décider avec un scrutin au jugement majoritaire


Règle: Chaque citoyen PEUT donner UNE mention à chaque option du scrutin

# Idéalement, une mention ne devrait être qu'un seul mot. M'enfin…
# La liste des mentions est sujette à débat: <lien vers débat>
# Et puis, où est passée la médiocrité?
# On pourrait fort bien aussi inverser l'ordre ici.  TBD
Règle: La première et meilleure mention est "excellent⋅e", "excellente" ou "excellent"
Règle: La seconde mention est "très bien"
Règle: La troisième mention est "bien"
Règle: La quatrième mention est "assez bien"
Règle: La cinquième mention est "passable"
Règle: La sixième mention est "insuffisant", "insuffisante" ou "insuffisant⋅e"
Règle: La septième et pire mention est "à rejeter"

Règle: Dans le cas d'un nombre pair de votes, on prend la médiane "du bas"


Scénario: Voter au jugement majoritaire
  Étant donné un citoyen nommé Rida
           Et un citoyen nommé Michel
           Et une citoyenne nommée Geneviève
           Et un citoyen nommé Steve
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Les modes de scrutin
          options:
            - uninominal à un tour
            - uninominal à deux tours
            - vote par liste
            - jugement majoritaire
          """
        Quand Rida vote sur le scrutin au jugement majoritaire titré "Les modes de scrutin":
          """
          uninominal à un tour:    à rejeter
          uninominal à deux tours: insuffisant
          vote par liste:          passable
          jugement majoritaire:    excellent
          """

           #Et Rida affiche la transaction

        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Les modes de scrutin" devrait être:
          """
          uninominal à un tour:    à rejeter
          uninominal à deux tours: insuffisant
          vote par liste:          passable
          jugement majoritaire:    excellent
          """

        Quand Michel vote sur le scrutin au jugement majoritaire titré "Les modes de scrutin":
          """
          uninominal à un tour:    à rejeter
          uninominal à deux tours: à rejeter
          vote par liste:          assez bien
          jugement majoritaire:    excellent
          """

        Quand Steve vote sur le scrutin au jugement majoritaire titré "Les modes de scrutin":
          """
          uninominal à un tour:    à rejeter
          uninominal à deux tours: à rejeter
          vote par liste:          assez bien
          jugement majoritaire:    excellent
          """

        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Les modes de scrutin" devrait être:
          """
          uninominal à un tour:    à rejeter
          uninominal à deux tours: à rejeter
          vote par liste:          assez bien
          jugement majoritaire:    excellent
          """



Scénario: Nombre pair de votant⋅e⋅s
  Étant donné un citoyen surnommé Stup
           Et un citoyen surnommé Flip
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Les croix
          options:
            - croix de bois
            - croix de fer
          """
        Quand Stup vote sur le scrutin au jugement majoritaire titré "Les croix":
          """
          croix de bois: bien
          croix de fer:  insuffisant
          """
        Quand Flip vote sur le scrutin au jugement majoritaire titré "Les croix":
          """
          croix de bois: passable
          croix de fer:  excellent
          """
        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Les croix" devrait être:
          """
          croix de bois:
            mention: passable
            position: 1
          croix de fer:
            mention: insuffisant
            position: 2
          """



Scénario: Trois votant⋅e⋅s, départage simple
  Étant donné un citoyen asymptotiquement proche de l'amploi surnommé Ric_hard
           Et une citoyenne en pleine expansion surnommée Hex
           Et un citoyen très fatigué surnommé Adre
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Les whiskies
          options:
            - suntory
            - mccalan
            - les chiens
          """
        Quand Ric_hard vote sur le scrutin au jugement majoritaire titré "Les whiskies":
          """
          mccalan: bien
          suntory: bien
          les chiens: bien
          """
        Quand Adre vote sur le scrutin au jugement majoritaire titré "Les whiskies":
          """
          mccalan: assez bien
          suntory: assez bien
          les chiens: très bien
          """
        Quand Hex vote sur le scrutin au jugement majoritaire titré "Les whiskies":
          """
          mccalan: assez bien
          suntory: très bien
          les chiens: excellent
          """
        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Les whiskies" devrait être:
          """
          mccalan:
            mention: assez bien
            position: 3
          suntory:
            mention: bien
            position: 2
          les chiens:
            mention: très bien
            position: 1
          """



Scénario: Départage d'options avec mention médiane identique
  Étant donné un citoyen surnommé Ali
           Et un citoyen surnommé Bob
           Et une citoyenne surnommée Cho
           Et une citoyenne surnommée Dia
           Et une citoyenne surnommée Eva
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Scrutin
          options:
            - Option A
            - Option B
            - Option C
          """
        Quand Ali vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: à rejeter
          Option B: à rejeter
          Option C: à rejeter
          """
        Quand Bob vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: insuffisant
          Option B: bien
          Option C: bien
          """
        Quand Cho vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: bien
          Option B: bien
          Option C: bien
          """
        Quand Dia vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: bien
          Option B: bien
          Option C: bien
          """
        Quand Eva vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: bien
          Option B: bien
          Option C: excellent
          """
        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Scrutin" devrait être:
          """
          Option A:
            mention: bien
            position: 3
          Option B:
            mention: bien
            position: 2
          Option C:
            mention: bien
            position: 1
          """


Scénario: Départage d'options n'ayant pas le même nombre de votes
  Étant donné un citoyen nommé Ali
           Et un citoyen nommé Bob
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Scrutin
          options:
            - Option A
            - Option B
          """
        Quand Ali vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: bien
          Option B: bien
          """
           Et Bob vote sur le scrutin au jugement majoritaire titré "Scrutin":
          """
          Option A: bien
          """
           Et Bob ne donne pas son avis sur l'autre option
        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Scrutin" devrait être:
          """
          Option A:
            mention: bien
            position: 1
          Option B:
            mention: à rejeter
            position: 2
          """



# Avoir des options nommées identiquement d'un scrutin à l'autre
# était une des limitations initiales connues de la base de code.
# Comme nous souhaitons enlever cette limitation, nous la testons.
# Comme ce scénario n'est pas très intéressant, mais utile pour développer
# et surtout pour éviter de régresser, il est taggué VIGIL.
@vigil
Scénario: Deux scrutins avec des options nommées identiquement
  Étant donnée une citoyenne nommée A
           #Et une citoyenne nommée B
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Scrutin A
          options:
            - Option 1
            - Option 2
          """
           Et un scrutin au jugement majoritaire comme suit:
          """
          titre: Scrutin B
          options:
            - Option 1
            - Option 2
          """
        Quand A vote sur le scrutin au jugement majoritaire titré "Scrutin A":
          """
          Option 1: à rejeter
          Option 2: bien
          """
           Et A vote sur le scrutin au jugement majoritaire titré "Scrutin B":
          """
          Option 1: très bien
          Option 2: excellent
          """
        Alors le dépouillement standard du scrutin au jugement majoritaire titré "Scrutin A" devrait être:
          """
          Option 1:
            mention: à rejeter
            position: 2
          Option 2:
            mention: bien
            position: 1
          """
           Et le dépouillement standard du scrutin au jugement majoritaire titré "Scrutin B" devrait être:
          """
          Option 1:
            mention: très bien
            position: 2
          Option 2:
            mention: excellent
            position: 1
          """
