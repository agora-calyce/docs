# Présentation

La **console d'Agora Calyce** est une plateforme open source qui permet de construire son propre cloud (IaaS, PaaS, SaaS) sur du matériel qu'on possède déjà. Kubernetes fait tourner le plan de contrôle ; les machines virtuelles, le stockage, le réseau et les services managés tournent par-dessus comme des charges de travail de première classe.

La **Console** (l'interface web dont traite ce guide) est le point d'entrée utilisateur de la plateforme. Elle permet de :

- créer et gérer des **instances** (machines virtuelles) et leurs snapshots,
- gérer du **stockage** : disques, snapshots de disque, sauvegardes, stockage objet,
- gérer le **réseau** : VPC, subnets, IP élastiques, load balancers, groupes de sécurité,
- provisionner des clusters **Kubernetes as a Service** (PaaS),
- administrer les **organisations**, **projets**, **utilisateurs** et **droits**.

## Ce que couvre cette documentation

Cette documentation est un guide pas à pas pour un utilisateur qui découvre la Console, organisé dans l'ordre où on utilise réellement la plateforme :

1. [Introduction](02-concepts.md) : vocabulaire et concepts.
2. [Prise en main](../02-prise-en-main/01-login.md) : se connecter, comprendre le tableau de bord.
3. [Administration](../03-administration/01-son-compte.md) : compte, organisation, projet.
4. [Utilisation](../04-utilisation/01-instance/01-creation-from-scratch.md) : créer des ressources (instances, stockage, réseau, sauvegardes).

Le PaaS ([Kubernetes as a Service](../05-paas/01-kaas/01-creer-cluster.md)) et le stockage objet ([Object Storage](../06-object-storage/01-creation-bucket.md)) sont détaillés dans leurs sections dédiées.