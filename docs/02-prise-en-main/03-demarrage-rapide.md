# Démarrage rapide

Parcours minimal pour passer de la première connexion à votre première ressource. Chaque étape renvoie vers la page détaillée.

## 1. Créer une organisation

1. Connectez-vous à la Console.
2. Avatar en haut à droite → **My Account** → onglet **Organizations**.
3. **Create an organization**, nommez-la et validez.
4. Invitez vos collaborateurs et attribuez-leur des groupes.

Détails : [Création d'une organisation](../03-administration/02-creation-organisation.md) · [Partager](../03-administration/03-partager-organisation.md) · [Droits](../03-administration/04-users-groups-droits.md).

## 2. Créer un projet

Un projet isole logiquement vos ressources (production, staging…). Depuis **Settings** de l'organisation → onglet **Projects** → **Create a project**.

Détails : [Création d'un projet](../03-administration/05-creation-projet.md).

## 3. Préparer le réseau

Avant toute instance ou tout cluster :

1. **VPC** : réseau virtuel privé, voir [Créer un VPC](../04-utilisation/03-network/01-creer-vpc.md).
2. **Subnet** : activez **NAT Gateway** si les ressources doivent sortir sur Internet, voir [Créer un subnet](../04-utilisation/03-network/02-creer-subnet.md).
3. **EIP** : IP publique, si vous devez exposer un service, voir [Créer une Elastic IP](../04-utilisation/03-network/03-creer-eip.md).

## 4. Déployer vos ressources

- **Machine virtuelle** : [Création d'une instance](../04-utilisation/01-instance/01-creation-from-scratch.md), puis [Linux](../04-utilisation/01-instance/02-guide-linux.md) ou [Windows](../04-utilisation/01-instance/03-guide-windows.md).
- **Cluster Kubernetes managé** : [Kubernetes (KaaS)](../05-paas/01-kaas/01-creer-cluster.md).