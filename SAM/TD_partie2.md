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

# TD7
## Exercice 4 page 4 (ER2-19)
1. $P(R) = \frac{card(R)}{T_{page} / largeur(R)} = \frac{card(R)}{a} \Leftrightarrow card(R) = P(R) * T_{page} / largeur(R) $

Taille d'un tuple de $R_1 : t(R_1) = 2 * 10 = 20$ octet

* $card(R_1) = 10 000 * 4000 / 20 = 10 000 * 200 = 2*10^6$
* $card(R_1 \bowtie R_2) = card(R_2) * \frac{card(R_1)}{nbValDistinctDeADansR_1} = card(R_2) = 2*10^7 $ car $R_2$ beaucoup plus grand que $R_1$ donc 

2. $P(T) = card(R_1 \bowtie R_2) * \frac{T_{page}}{largeur(T)} = 2*10^7 * \frac{4000}{30} = 150 000$ ; $P(Q) = card(Q) * \frac{4000}{40} = card(T) * 100$ je sais pas pourquoi le cardinal $ = 200 000$ 

3. Par Hashage
   1. Pas de transfert, jointure par hachage externe, avec $R_2$ et $R_1$ qui ne tienne pas en mémoire avec $K = 200, cout(R_1 \bowtie R_2) = 2 \left\lfloor \log_{K}(P(R_1)) \right\rfloor (P(R_1) + P(R_2)) + P(R) + P(R_2)  = P(R_1)*t_{io} + P(R_2)*t_{io} = 110 000 t_{io}$ 
   2.  Transfert de $P(T) = 2*10^7$ pages sur S3 : $cout = 150 000 t_s$
   3.  Calcul de $Q$ sur S3 : $cout(Q) = (P(T) + P(R_3))t_{io} = 160000 t_{io}$
   4.  Transfert de $Q$ sur S1 : $cout = P(Q)t_s = 200 000 t_s$ 
   5.  Finalement : $110 000 t_{io} + 160 000 t_{io} + 150 000 t_s + 200 000 t_s = 270 000 t_{io} + 350 000 t_s$ 
Par tri fusion 
=> J'ai faux je comprends rien à la correction 

Pourquoi on doit se fix des blocs comme ça ? Pourquoi on divise par 50 pour R2 ? Pourquoi on utilise pas la formule du cout par hachage externe ? Qui ne peux mathématiquement pas donner un 3 pour le premier coût

## Exercice 1 page 12
