# Fiche 
## BD réparties
- Réutiliser les fragementation précédente comme filtre avec les jointures 
- Fragmentation horizontale : selection sur la table général ($garage_v$ TD6-exo1)
- Fragmentation horizontale dérivé : réutilisation d'une fragmentation poru refaire une fragmentation 
- Fragmentation disjointe : lorsqu'il y n'y a pas de répétition dans entre les fragments de cette table.

# TD6
## Exercice 1a
1. 
Soit $v$ la ville du garage et $idgarage$ sont id
- $Garage_v = \sigma_{ville=v}(Garage)$
- $Habilite_v =  Habilite \bowtie Garage_v $
- $Mecanicien_v = Mecanicien \bowtie Garage_v$
- $Personne_v = Personne \bowtie Mecanicien_v$
- $Reparation_v = Reparation \bowtie Mecanicien_v$
- $Client_v = Client \bowtie Réparation_v$
- $Possede_v = Possede \bowtie Client_v$
- ~~Tarif_v = Tarif \bowtie Reparation_v~~  $Tarif_v = Tarif $ répliqué dans toute les villes

2. 
Pas disjoint si un client vas dans plusieurs ville ? Dans la correction de mathilde y'on dit que $possede_v$ et les fragment dérivé sont non disjoint ?? 

3.
Facile, on fait la même chose mais avec 
- $Habilite_m = \sigma_{m}(Habilite)$
- $Garage_m = Garage \bowtie Habilite_m$

## Exercice 1b
1. On veut les marque des voiture ayant subit une réparation de moins de 100€ et avec une immatriculation < 6000
2. Version brutforce $\sigma_{prix < 100 \& immat <6000}((Reparation \bowtie_{intervention} Tarif) \bowtie_{immat} Possede)$
   Version qui suit la consigne  $\sigma_{prix < 100}(Tarif) \bowtie \sigma_{imat < 6000} (Possede) \bowtie Reparation$
3.  $\sigma_{prix < 100}(Tarif_{S1}) \bowtie \sigma_{imat < 6000} (Possede_{S1}) \bowtie Reparation_{S1}$ Wouah compliqué compliqué la correction alors que c'était évident 
4.  C'était dire qu'on utilisait que le S1 car on a pas de donnée correspondant à nos filtre en S2
5.  Aucune donnée transféré car on peut tout faire en S1. Efficace