# Exposer le cluster

Pour que les applications soient joignables de l'extérieur (notamment pour Let's Encrypt), le cluster doit être joignable en HTTP/HTTPS.

!!! note "À créer après le cluster"

    Ces deux ressources se créent **après** le [cluster](01-creer-cluster.md) (le LB a besoin de son `effectiveId`, l'EIP de l'IP du LB).

```
Client → EIP:80/443 → LB:80/443 → nœuds k8s:30080/30443
```

## Load Balancer

**Network > Load Balancer > Create a Load Balancer** (voir [Load Balancer](../../04-utilisation/03-network/04-load-balancer.md)) :

- **Virtual IP** : une IP libre dans `198.18.0.0/16` (plage réservée aux VIP de LB, sans lien avec le subnet du cluster). Vérifiez qu'elle n'est pas déjà utilisée.
- **Selectors** : mapping de type **Selector**, clé `cluster.x-k8s.io/cluster-name`, valeur = `effectiveId` du cluster (visible dans les détails du cluster ou dans les labels d'un nœud).
- **Port forwarding** : `80 → 30080 [TCP]` et `443 → 30443 [TCP]` (l'IngressController par défaut des clusters est basé sur Traefik).

## Elastic IP

Créez une [EIP](../../04-utilisation/03-network/03-creer-eip.md) :

- **Linked Subnet** : le subnet du cluster.
- **SNAT** sur le CIDR du subnet du cluster (sortie Internet des nœuds).
- **DNAT** : ports 80/443 de l'EIP → **VIP du Load Balancer** (et non une IP de nœud).

| Bloc | Champ | Exemple |
|---|---|---|
| SNAT Rule | Internal CIDR → External IP | `10.64.18.0/24` → `185.x.x.x` |
| DNAT Rule | External → Internal (tcp) | `:80` → `198.18.0.10:80` |
| DNAT Rule | External → Internal (tcp) | `:443` → `198.18.0.10:443` |

!!! note "DNS des ingress"

    L'entrée DNS wildcard des ingress du cluster doit pointer vers l'IP externe de l'EIP.
