# Mettre à jour le cluster

Trois opérations : modifier la configuration du cluster, changer la version de Kubernetes, ou passer à la dernière release de la version courante. Elles exigent le droit **KaaS Write** sur le projet.

## Modifier la configuration du cluster

Liste des clusters → **Details** → **Options > Edit**. Vous pouvez notamment :

- **changer le nombre de replicas** d'un node group (de 1 à 10) : ajout ou retrait de workers ;
- **ajouter un node group** (5 au maximum) ou **en supprimer un** : le groupe supprimé et ses nœuds sont détruits ;
- **modifier le dimensionnement** d'un groupe (Cores, RAM, Boot disk size, classe de stockage, subnets) : les workers du groupe sont alors remplacés un par un (*rolling update*) ;
- modifier les [Cluster Network Policies](01-creer-cluster.md#cluster-network-policies), la **configuration avancée** (KaaS Essentials, Post Installation Chart) et le **Disaster Recovery**.

Seule la modification du nombre de replicas ne remplace pas les nœuds existants.

!!! warning "Contraintes de modification"

    - le **Name** d'un node group identifie le groupe : le renommer revient à supprimer l'ancien et à en créer un nouveau ;
    - la taille du volume Disaster Recovery peut être augmentée, jamais réduite ;
    - activer ou désactiver le Disaster Recovery et changer de version Kubernetes ne peuvent pas se faire dans la même mise à jour.

## Changer la version de Kubernetes

Liste des clusters → **Details** → **Options > Edit** → choisissez la version cible → **Next** → laissez le réseau tel quel → **Update**.

La durée dépend des applications installées : pour les applications stateful (BDD), le processus attend le `Finalizer` de chaque pod avant de le déplacer. Un **downgrade** n'est pas recommandé : seuls les workers redescendent, le control plane reste à sa version.