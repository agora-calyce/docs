# Contribuer

Merci de votre intérêt pour la documentation Agora Calyce !

## Signaler un problème

Ouvrez une issue en décrivant la page concernée, ce qui est faux ou manquant, et si possible une capture d'écran.

## Proposer une modification

1. Forkez le dépôt et créez une branche (`fix/...`, `docs/...`).
2. Faites vos modifications sous `docs/`. Une nouvelle page doit être ajoutée dans `nav` de `zensical.toml`.
3. Vérifiez localement :

    ```bash
    make lint-md
    make build
    ```

4. Ouvrez une pull request avec une description courte de la modification.

Vous pouvez aussi utiliser le bouton « Modifier » présent sur chaque page du site.

## Règles de rédaction

- Rédaction en français.
- Listes avec `-`, sous-listes indentées de 4 espaces, ligne vide avant et après une liste.
- Images dans un dossier `images/` à côté de la page, avec un texte alternatif.
- Ne jamais inclure d'informations sensibles : identifiants, tokens, adresses IP réelles, noms de clients.
