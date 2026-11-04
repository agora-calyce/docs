# Concepts

Quelques notions à connaître avant de naviguer dans la Console.

## Organisation

Entité de facturation et de gouvernance de haut niveau. Chaque nouvel utilisateur reçoit automatiquement une organisation personnelle (**Personal Org**) à sa première connexion.

Une organisation appartient toujours à un utilisateur principal, le **superadmin** (propriétaire), et représente souvent un client. Elle peut avoir plusieurs membres, chacun avec des droits différents (voir [Users / Groups / Droits](../03-administration/04-users-groups-droits.md)).

→ [Création d'une organisation](../03-administration/02-creation-organisation.md)

## Projet

Sous-espace d'une **organisation** qui regroupe des ressources (instances, disques, réseaux…). Un projet nommé `default` est créé automatiquement avec l'organisation personnelle. Une organisation peut contenir plusieurs projets, par exemple pour séparer un environnement de test d'un environnement de production.

Des ressources dans différents projets ne peuvent pas communiquer sans passer par Internet. Au sein d'un même projet, la communication interne est possible.

!!! note "Le projet, brique d'isolation réseau"

    Il est important de comprendre qu'au niveau réseau, un projet est une **brique d'isolation**.

Un **système de Plan de Reprise d'Activité (PRA)** est également mis en place au niveau d'un projet. En cas de sinistre majeur, le projet entier est basculé.

→ [Création d'un projet](../03-administration/05-creation-projet.md)

## AZ (Availability Zone)

Zone de disponibilité, concrètement un cluster de datacenters (ou un seul en mode non HA), sur lequel une ressource est provisionnée. Chaque ressource (instance, disque, VPC…) est créée dans une AZ précise, choisie lors de sa création.

En cas de défaillance d'un datacenter au sein d'une AZ, les ressources sont déplacées automatiquement sur un autre datacenter de la même AZ.

Un projet n'est pas lié à une seule AZ : il peut contenir des ressources dans plusieurs AZ (par exemple des instances dans une AZ et du stockage dans une autre).

!!! note "AZ fixée à la création"

    L'AZ d'une ressource est choisie à sa création et ne peut plus être modifiée.

La reprise d'activité s'organise **entre AZ** : les données et ressources d'un projet entier peuvent être répliquées ou sauvegardées d'une AZ vers une autre, afin de pouvoir y remonter le projet si la première devient indisponible.

## Permissions et groupes

Chaque utilisateur d'une organisation appartient à un ou plusieurs **groupes**, eux-mêmes associés à des **permissions** (lecture/écriture par type de ressource, administration de l'organisation, etc.). Trois groupes prédéfinis existent (`Admin`, `Billing`, `Developer`) et des groupes personnalisés peuvent être créés.

→ [Users / Groups / Droits](../03-administration/04-users-groups-droits.md)

## Contexte Organisation / Projet

En haut de chaque page de la Console se trouvent deux sélecteurs : **Organization** et **Project**. Toutes les listes et actions affichées (instances, disques, réseaux…) sont contextualisées par cette paire organisation/projet active. Changer de projet ou d'organisation change immédiatement le contenu affiché, sans recharger la page.

## Dépendances entre ressources réseau

Les ressources réseau ont des dépendances entre elles, dans cet ordre :

```
VPC  →  Subnet  →  EIP (associé au subnet)
```

!!! note "Subnet requis pour une instance"

    Une instance a elle-même besoin d'un subnet existant pour être créée.