MODULE DE FORMATION
Analytics Engineering avec dbt
Introduction à la Base de Données Pagila

1. Présentation Générale Pagila est l'adaptation PostgreSQL de la célèbre base Sakila. Elle modélise le système d'information d'une chaîne de magasins de location de DVD. C'est un standard de référence pour l'enseignement de la data.

2. Architecture des Données Le schéma est organisé en 15 tables principales regroupées par thématiques :

• Inventaire : `film`, `inventory`, `category`, `language`.

• Clients : `customer`, `address`, `city`, `country`.

• Transactions : `rental`, `payment`.

• Personnel & Magasins : `staff`, `store`.

3. Utilité dans notre projet dbt

• Modélisation Dimensionnelle : Passer d'un schéma OLTP normalisé à un schéma en étoile (Star Schema).

• Nettoyage & Staging : Pratiquer le renommage et le cast des types.

• Tests & Gouvernance : Utiliser les tests `unique`, `not_null`, `relationships` et `accepted_values` (ex: sur le champ `rating` des films).

4. Conclusion Pagila représente fidèlement la réalité d'un système de production : riche et imparfaite. Elle nécessite une transformation structurée que dbt permet de construire couche après couche.
