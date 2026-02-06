#language: fr
@fr
Fonctionnalité: Privatiser un scrutin par invitations
  Dans le but de "sécuriser" mon scrutin
  En tant qu'organisateur⋅e
  Je veux le rendre accessible sur invitation seulement

  # Into distribuer-des-invitations
  # ou publiciser-un-scrutin ?
  Je veux pouvoir distribuer une liste d'invitations moi-même
  Je veux pouvoir distribuer une liste d'invitations par email
  Je veux pouvoir distribuer une liste d'invitations par SMS
  Je veux pouvoir distribuer une liste d'invitations par twitter


Règle: Une invitation ne peut être acceptée que par un⋅e seul⋅e participant⋅e


# Drafts
Règle: Il faut une invitation pour participer à un scrutin privé
Règle: Il me faut une invitation pour participer à un scrutin privé, quelque soit mon rôle
Règle: On ne peut pas participer à un scrutin privé sans invitation
########

#  En tant que visiteur, je suis titulaire d'un jeton d'invitation à participer à un scrutin.
#  Ce jeton doit me permettre de retrouver le scrutin.
#  Ce jeton protégé par une passphrase doit me permettre de consulter/modifier mon vote.

# Pas très propre, mais on a les trois scénarios en un pour l'instant.
Scénario: Créer un scrutin privé et des invitations
Scénario: Échouer à participer frauduleusement à un scrutin privé
Scénario: Participer à un scrutin par invitation
  Étant donné un citoyen nommé Jean-Luc
           Et une citoyenne nommée Marianne
        Quand Jean-Luc crée un scrutin comme suit:
          """
          sujet: La Primaire 2022 de la France Insoumise
          propositions:
          - Jean-Luc Mélenchon
          - Manon Aubry
          - Adrien Quatennens
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          - Charles Pasqua
          - …
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Alors Jean-Luc devrait réussir
        Quand Marianne tente de voter sur le scrutin de "La Primaire 2022 de la France Insoumise":
          """
          Jean-Luc Mélenchon: Très Bien
          """
        Alors Marianne devrait échouer
# Sachant que Jean-Luc ne devrait avoir aucune invitation
        Quand Jean-Luc génère 10 invitations pour le scrutin de "La Primaire 2022 de la France Insoumise"
        Alors Jean-Luc devrait réussir
           Et Jean-Luc devrait avoir 10 invitations
        Quand Marianne accepte l'invitation N°1 de Jean-Luc
        Quand Marianne tente de voter sur le scrutin de "La Primaire 2022 de la France Insoumise":
          """
          Jean-Luc Mélenchon: Très Bien
          """
        Alors Marianne devrait réussir

Scénario: Ne pas pouvoir inviter par mail sans KYC
  Étant donné un citoyen nommé Bob
           Et Bob n'a pas d'email vérifié
           Et une citoyenne nommée Marine
        Quand Bob crée un scrutin comme suit:
          """
          sujet: Le meilleur fruit
          propositions:
          - Pomme
          - Banane
          - Orange
          - Fraise
          - Raisin
          - Ananas
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Alors Bob devrait réussir
        Quand Bob tente d'inviter par email un citoyen nommé Marine pour le scrutin de "Le meilleur fruit"
        Alors Bob devrait échouer
         Mais Bob devrait recevoir un message lui demandant d'avoir un email vérifié

Scénario: Pouvoir inviter par mail
  Étant donné un citoyen nommé Bob
           Et Bob a un email vérifié
           Et une citoyenne nommée Marine
        Quand Bob crée un scrutin comme suit:
          """
          sujet: Le meilleur fruit
          propositions:
          - Pomme
          - Banane
          - Orange
          - Fraise
          - Raisin
          - Ananas
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Alors Bob devrait réussir
        Quand Bob tente d'inviter par email un citoyen nommé Marine pour le scrutin de "Le meilleur fruit"
        Alors Bob devrait réussir
           Et Marine devrait recevoir une invitation par email

# FIXME: Utiliser un autre exemple de scrutin
Scénario: Limiter le nombre d'invitations générables (cent? mille?)
  Étant donné un citoyen nommé Jean-Luc
           Et Jean-Luc crée un scrutin comme suit:
          """
          sujet: La Primaire FI 2022
          propositions:
          - Jean-Luc Mélenchon
          - Manon Aubry
          - Adrien Quatennens
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          mentions:
          - Insuffisant
          - Passable
          - Bien
          - Très Bien
          - Excellent
          accès: privé
          """
        Quand Jean-Luc génère dix invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
           Et Jean-Luc devrait avoir dix invitations
        Quand Jean-Luc génère cent invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
         Mais Jean-Luc devrait avoir cent invitations
        # Car les dix premières invitations sont les mêmes
        Quand Jean-Luc génère deux cent invitations pour le scrutin de "La Primaire FI 2022"
        Alors Jean-Luc devrait réussir
         Mais Jean-Luc ne devrait avoir que cent invitations
        # Car les cent premières invitations sont les mêmes


# FIXME: Utiliser un autre exemple de scrutin
Scénario: Échouer à générer des invitations pour un scrutin dont on est pas l'auteur
  Étant donné un citoyen nommé Jean-Luc
           Et une citoyenne nommée Marine
           Et Jean-Luc crée un scrutin comme suit:
          """
          sujet: La Primaire FI 2022
          propositions:
          - Jean-Luc Mélenchon
          - Manon Aubry
          - Adrien Quatennens
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          mentions:
          - Non
          - Oui
          accès: privé
          """
         Mais Marine n'est pas invitée
           Et Marine n'aime pas ça
        Alors Marine tente de générer une invitation pour le scrutin de "La Primaire FI 2022"
         Mais Marine devrait échouer


# FIXME: Utiliser un autre exemple de scrutin
Scénario: Échouer à accepter une invitation déjà acceptée par quelqu'un d'autre
  Étant donné un citoyen nommé Jean-Luc
           Et une citoyenne nommée Sofia
           Et un citoyen surnommé Sbire
           Et Jean-Luc crée un scrutin comme suit:
          """
          sujet: Votre Politicien⋅ne Peertubeur⋅e Favori⋅te
          propositions:
          - Jean-Luc Mélenchon
          - Caroline Fiat
          - François Ruffin
          - Danièle Obono
          - Jean-Hughes Ratenon
          - Clémentine Autain
          - Ugo Bernalicis
          - Charlotte Girard
          mentions:
          - Je ne connais pas
          - Je connais
          - Je connais depuis peu, ça m'intéresse un peu
          - Je connais et j'aime plutôt bien
          - Je connais et j'aime beaucoup
          - C'est mon FAVORI !
          - C'est ma FAVORITE !
          accès: privé
          """
           Et Jean-Luc génère deux invitations pour le scrutin de "Votre Politicien⋅ne Peertubeur⋅e Favori⋅te"
           Et Sofia accepte l'invitation N°1 de Jean-Luc
         Mais Sbire dérobe Jean-Luc sous couvert d'une perquisition
           Et Jean-Luc n'aime pas ça
           Et Sofia n'aime pas ça
           Et La France n'aime pas ça
           Et Sbire tente d'accepter l'invitation N°1 de Jean-Luc
         Mais Sbire devrait échouer
#         Mais cette invitation est déjà acceptée par quelqu'un d'autre
        # Car l'invitation a déjà été acceptée par Sofia


Scénario: Brûler les invitations non-acceptées
# Sa propre feature ?


Scénario: Générer des invitations avec liens uniques par utilisateur
  Étant donné un citoyen nommé Organisateur
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Scrutin privé avec liens uniques
          propositions:
            - Proposition A
            - Proposition B
          mentions:
            - Non
            - Oui
          accès: privé
          """
        Quand Organisateur génère 5 invitations pour le scrutin de "Scrutin privé avec liens uniques"
        Alors Organisateur devrait réussir
           Et Organisateur devrait avoir 5 invitations
           Et chaque invitation devrait avoir un lien unique
           Et aucun lien d'invitation ne devrait être identique


Scénario: Vérifier qu'un lien d'invitation ne peut être utilisé qu'une seule fois
  Étant donné un citoyen nommé Organisateur
           Et une citoyenne nommée Alice
           Et un citoyen nommé Bob
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Scrutin avec invitation unique
          propositions:
            - Candidat X
            - Candidat Y
          mentions:
            - Non
            - Oui
          accès: privé
          """
           Et Organisateur génère 2 invitations pour le scrutin de "Scrutin avec invitation unique"
           Et Alice accepte l'invitation N°1 de Organisateur
        Quand Bob tente d'accepter l'invitation N°1 de Organisateur
        Alors Bob devrait échouer
         Mais Bob devrait recevoir un message indiquant que l'invitation a déjà été acceptée


Scénario: Envoyer des invitations par email avec lien unique
  Étant donné un citoyen nommé Organisateur
           Et Organisateur a un email vérifié
           Et une citoyenne nommée Destinataire avec l'email "destinataire@example.com"
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Scrutin par email
          propositions:
            - Motion A
            - Motion B
          mentions:
            - Contre
            - Pour
          accès: privé
          """
        Quand Organisateur envoie une invitation par email à "destinataire@example.com" pour le scrutin de "Scrutin par email"
        Alors Organisateur devrait réussir
           Et Destinataire devrait recevoir un email avec un lien d'invitation unique
           Et le lien d'invitation devrait permettre à Destinataire de participer au scrutin


Scénario: Ne pas pouvoir générer des invitations pour un scrutin public
  Étant donné un citoyen nommé Organisateur
           Et Organisateur crée un scrutin comme suit:
          """
          sujet: Scrutin public
          propositions:
            - Option A
            - Option B
          mentions:
            - Non
            - Oui
          accès: public
          """
        Quand Organisateur tente de générer 5 invitations pour le scrutin de "Scrutin public"
        Alors Organisateur devrait échouer
         Mais Organisateur devrait recevoir un message indiquant que les invitations sont réservées aux scrutins privés


Scénario: Distribuer des invitations à un scrutin soi-même
Scénario: Distribuer des invitations à un scrutin par courriel
Scénario: Distribuer des invitations à un scrutin par SMS
  # → Je pense que ça ira dans sa propre feature distribuer-des-invitations


#Fonctionnalité: Création d'un compte
#
#En tant que visiteur, lorsque je participe à un scrutin.
#Il m'est proposé de créer un compte.
#
#---->Si je crée mon compte après la soumission d'un vote, il m'est proposé de lier mon vote à mon compte.

