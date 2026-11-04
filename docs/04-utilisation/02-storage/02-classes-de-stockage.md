# Classes de stockage

À l'étape **Storage** de la création d'un disque (voir [Création de disque](01-creation-disque.md#etape-3-storage)), le champ **Storage class** propose les classes disponibles dans l'AZ sélectionnée. Chaque AZ peut exposer un sous-ensemble différent de ces classes selon le matériel/backend de stockage sous-jacent (Rook/Ceph, SFS…).

!!! warning "Données de santé (HDS)"

    Dans le cas de l'**Hébergement de Données de Santé (HDS)**, il est obligatoire d'utiliser les classes de stockages `-encrypted`.

| Storage class | Description / cas d'usage |
|---|---|
| `block-highspeed` | Stockage **NVMe** haute performance. Latence minimale et IOPS élevés. Pour les bases de données, les caches et les charges I/O intensives. |
| `block-standard` | Stockage **NVMe avec erasure coding**. Bon compromis performance, capacité utile et résilience. Classe par défaut pour la plupart des charges (applications, serveurs web, volumes de données). |
| `block-hdd` | Stockage **HDD (SATA)**. Performances modérées. Pour les archives, sauvegardes, journaux et données peu sollicitées. |
| `block-highspeed-encrypted` | Identique à `block-highspeed`, avec **chiffrement au repos** en plus. |
| `block-standard-encrypted` | Identique à `block-standard`, avec **chiffrement au repos** en plus. |
| `block-hdd-encrypted` | Identique à `block-hdd`, avec **chiffrement au repos** en plus. |