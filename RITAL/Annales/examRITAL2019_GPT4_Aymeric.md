# Examen RITAL 2019

# Exercice 1
Soit un corpus de documents dont le vocabulaire est composé de 8 mots numérotés de A à H. Les documents de ce corpus sont les suivants :
- D1 = AAA
- D2 = BBB
- D3 = AABDE
- D4 = ABDFGH
- D5 = C
- D6 = B
- D7 = H
- D8 = DDDGGGH

Soit la requête Q=ABC.

## Question 1
Rappeler à quoi correspond l'IDF d'un terme. Donner une formule simpliée de l'IDF et le calculer pour les mots A, B, C.

### **Réponse**

L'IDF (Inverse Document Frequency) est une mesure qui vise à quantifier l'importance d'un terme dans un corpus de documents. Elle est calculée en prenant l'inverse de la fréquence des documents contenant ce terme. L'IDF donne plus de poids aux termes qui apparaissent rarement dans le corpus, car ils sont considérés comme plus informatifs.

Formule simplifiée de l'IDF:
IDF(t) = log(N / df(t)), où t est un terme, N est le nombre total de documents dans le corpus et df(t) est le nombre de documents contenant le terme t.

Pour calculer l'IDF pour les mots A, B et C:

Nombre total de documents, N = 8

- df(A) = 3 (D1, D3, D4)
- df(B) = 3 (D2, D3, D6)
- df(C) = 1 (D5)
- IDF(A) = log(8/3) ≈ 0.903
- IDF(B) = log(8/3) ≈ 0.903
- IDF(C) = log(8/1) = 2

## Question 2
Calculer le score de pertinence de chacun des documents du corpus pour la requête Q selon le modèle vectoriel basé sur un produit scalaire. On considérera une pondération TF pour les termes des documents et une pondération IDF pour les termes de la requête.

### **Réponse**

Pour calculer le score de pertinence des documents du corpus pour la requête Q selon le modèle vectoriel basé sur un produit scalaire, nous devons d'abord pondérer les termes des documents avec la mesure TF (Term Frequency) et les termes de la requête avec la mesure IDF.

Pondération TF des termes des documents:

- D1: A=3, B=0, C=0
- D2: A=0, B=3, C=0
- D3: A=2, B=1, C=0
- D4: A=1, B=1, C=0
- D5: A=0, B=0, C=1
- D6: A=0, B=1, C=0
- D7: A=0, B=0, C=0
- D8: A=0, B=0, C=0

Pondération IDF des termes de la requête Q:

Q = {A: 0.903, B: 0.903, C: 2}

Ensuite, calculons le produit scalaire pour chaque document:

- Score(D1) = (3 * 0.903) + (0 * 0.903) + (0 * 2) = 2.709
- Score(D2) = (0 * 0.903) + (3 * 0.903) + (0 * 2) = 2.709
- Score(D3) = (2 * 0.903) + (1 * 0.903) + (0 * 2) = 2.709
- Score(D4) = (1 * 0.903) + (1 * 0.903) + (0 * 2) = 1.806
- Score(D5) = (0 * 0.903) + (0 * 0.903) + (1 * 2) = 2
- Score(D6) = (0 * 0.903) + (1 * 0.903) + (0 * 2) = 0.903
- Score(D7) = (0 * 0.903) + (0 * 0.903) + (0 * 2) = 0
- Score(D8) = (0 * 0.903) + (0 * 0.903) + (0 * 2) = 0

Ordonnancement des documents selon le score de pertinence: D1, D3, D2, D5, D4, D6, D7, D8.

## Question 3
Sachant que les documents pertinents sont les documents D1, D3 et D4, calculer la précision, le rappel, le MRR et le NDCG au rang 5 de l'ordonnancement retourné en question 2.

### **Réponse**

Pour calculer la précision, le rappel, le MRR et le NDCG au rang 5 de l'ordonnancement retourné en question 2, nous devons d'abord identifier les documents pertinents (D1, D3 et D4) dans les 5 premiers documents de l'ordonnancement.

Ordonnancement des 5 premiers documents: D1, D3, D2, D5, D4

Documents pertinents parmi les 5 premiers: D1, D3, D4

- Précision = (Nombre de documents pertinents retrouvés) / (Nombre de documents retrouvés)
- Précision = 3 / 5 = 0.6

- Rappel = (Nombre de documents pertinents retrouvés) / (Nombre total de documents pertinents)
- Rappel = 3 / 3 = 1

Pour calculer le MRR, nous devons d'abord déterminer le rang de chaque document pertinent:

- D1: Rang 1
- D3: Rang 2
- D4: Rang 5

- MRR (Mean Reciprocal Rank) = (1 / Rang du premier document pertinent)
- MRR = 1 / 1 = 1

Pour calculer le NDCG au rang 5, nous devons d'abord déterminer le DCG (Discounted Cumulative Gain) et le IDCG (Ideal Discounted Cumulative Gain):

- DCG = Σ (gain(i) / log2(i+1)), où i est le rang du document
- DCG = (1 / log2(2)) + (1 / log2(3)) + (1 / log2(6)) ≈ 1.892

- IDCG = Σ (gain(i) / log2(i+1)), où i est le rang du document dans l'ordonnancement idéal
- IDCG = (1 / log2(2)) + (1 / log2(3)) + (1 / log2(4)) ≈ 2.130

- NDCG = DCG / IDCG
- NDCG = 1.892 / 2.130 ≈ 0.888

Ainsi, les valeurs calculées sont les suivantes:

- Précision: 0.6
- Rappel: 1
- MRR: 1
- NDCG au rang 5: 0.888

# Exercice 3
Une des expressions formelles de la loi de Zipf est la suivante :
frequence = λ / rang (avec λ > 0) (3)

## Question 1
Quelle est l'intuition de la loi de Zipf ? A quoi sert-elle ?

### **Réponse**

La loi de Zipf est une loi empirique qui décrit la distribution des fréquences des mots dans un texte ou une collection de textes. L'intuition de la loi de Zipf est que la fréquence d'un mot est inversement proportionnelle à son rang dans la liste des mots classés par fréquence. Autrement dit, les mots les plus fréquents apparaissent beaucoup plus souvent que les mots moins fréquents. La loi de Zipf est utile pour étudier et modéliser les distributions de fréquence des mots dans les corpus de texte, ce qui peut aider à comprendre les propriétés statistiques du langage et à développer des méthodes pour le traitement automatique du langage naturel.

## Question 2
On suppose que le 50e mot le plus fréquent a une probabilité d'apparition de 0.02 dans une collection de 10 000 mots. Quel est le rang d'un mot qui apparaît 40 fois dans la collection ?

### **Réponse**

Selon la loi de Zipf, la fréquence d'un mot est donnée par:

frequence = λ / rang

On nous donne la probabilité d'apparition du 50e mot le plus fréquent (0.02) et la taille de la collection (10 000 mots). On peut calculer la fréquence du 50e mot en multipliant la probabilité d'apparition par la taille de la collection:

frequence_50 = 0.02 * 10 000 = 200

On peut ensuite déterminer λ en utilisant la loi de Zipf:

200 = λ / 50

λ = 200 * 50 = 10 000

Maintenant, on cherche le rang d'un mot qui apparaît 40 fois dans la collection. On utilise à nouveau la loi de Zipf:

frequence = λ / rang

40 = 10 000 / rang

rang = 10 000 / 40 = 250

Le rang du mot qui apparaît 40 fois dans la collection est 250.

## Question 3
Si on considère que tous les mots d'une collection ont des fréquences différentes, quel est le nombre total d'occurrences si on considère λ = 36 000 000 ? Indication : Posez juste la formule, sans faire de calculs si trop compliqué.

### **Réponse**

Pour calculer le nombre total d'occurrences en considérant λ = 36 000 000 et que tous les mots d'une collection ont des fréquences différentes, nous devons sommer les occurrences pour chaque mot en utilisant la loi de Zipf. Si on considère n comme le nombre total de mots uniques dans la collection, la formule du nombre total d'occurrences T est la suivante:

T = Σ (λ / rang)

avec rang allant de 1 à n.

En utilisant λ = 36 000 000, la formule devient:

T = Σ (36 000 000 / rang)

avec rang allant de 1 à n.

Il est difficile de calculer cette somme sans connaître la valeur de n, mais cette formule donne une idée du nombre total d'occurrences en fonction du rang de chaque mot et de la valeur de λ.

# Exercice 4
On considère une collection de documents $D = \{d_1, ..., D_N \}$ et une requête $q$. Pour chaque couple $\{d, q\}$ on dispose d'un jugement de pertinence binaire $R_d$. Un document $d_j$ est représenté par un vecteur binaire $d_1 = \{t_{j1}, ..., t_{jn}\}$ avec $n$ exprimant la taille du vocabulaire. On suppose que les termes sont indépendants et que la probabilité d'apparition du terme $t_{ji}$ dans un document pertinent $d_j$ pour la requête $q$ suit une loi de Bernouilli de paramètre $p_i$ : $P(t_{ji}|R = 1, q) = p_i$.

## Question 1
Démontrer que la probabilité d'un document dj pertinent pour la requête q est : $p(d_j |R = 1, q) = \Pi^n_{i=1} p^{t_{ji}}_i (1 − p_i)^{1−t_{ji}}$.

### **Réponse**

On cherche à démontrer que la probabilité d'un document $d_j$ pertinent pour la requête $q$ est : $p(d_j |R = 1, q) = \Pi^n_{i=1} p^{t_{ji}}i (1 − p_i)^{1−t{ji}}$.

Étant donné que les termes sont indépendants, la probabilité conjointe d'observer tous les termes $t_{j1}, ..., t_{jn}$ dans un document $d_j$ pertinent est le produit des probabilités individuelles des termes. Pour un terme $t_{ji}$, il y a deux cas possibles :

Le terme $t_{ji}$ est présent dans le document ($t_{ji} = 1$). Dans ce cas, la probabilité d'observer ce terme est $p_i$.

Le terme $t_{ji}$ n'est pas présent dans le document ($t_{ji} = 0$). Dans ce cas, la probabilité de ne pas observer ce terme est $1 - p_i$.

La probabilité d'observer les termes $t_{ji}$ dans le document $d_j$ pertinent est donc donnée par:

$p(t_{ji} | R = 1, q) = p^{t_{ji}}i (1 - p_i)^{1-t{ji}}$

En utilisant l'indépendance des termes, nous avons la probabilité conjointe pour tous les termes:

$p(d_j | R = 1, q) = \Pi^n_{i=1} p(t_{ji} | R = 1, q) = \Pi^n_{i=1} p^{t_{ji}}i (1 − p_i)^{1−t{ji}}$

## Question 2
On note Dr ⊂ D l'ensemble des Nr documents pertinents. Donner l'expression de la logvraisemblance du modèle binaire p(dj |R = 1, q).

### **Réponse**

La log-vraisemblance du modèle binaire est définie comme la somme des logarithmes des probabilités des documents pertinents. Dans notre cas, pour un ensemble $D_r$ de $N_r$ documents pertinents, la log-vraisemblance du modèle binaire $p(d_j | R = 1, q)$ est :

$\text{Log-vraisemblance} = \sum_{d_j \in D_r} \log p(d_j | R = 1, q)$

En utilisant l'expression de la probabilité d'un document $d_j$ pertinent pour la requête $q$ que nous avons démontré à la question 1 :

$\text{Log-vraisemblance} = \sum_{d_j \in D_r} \log \left(\Pi^n_{i=1} p^{t_{ji}}i (1 − p_i)^{1−t{ji}}\right)$

En appliquant la propriété du logarithme qui permet de transformer un produit en somme :

$\text{Log-vraisemblance} = \sum_{d_j \in D_r} \sum^n_{i=1} \left(t_{ji} \log p_i + (1 - t_{ji}) \log(1 - p_i)\right)$

Cette expression représente la log-vraisemblance du modèle binaire $p(d_j | R = 1, q)$ pour l'ensemble des documents pertinents $D_r$.

# Exercice 5
On s'intéresse maintenant aux modèles de recherche d'information faisant appel aux techniques de machine learning.

## Question 1
Expliquer en quoi les modèles de "learning-to-rank" se différencient des modèles de RI classiques (modèles vectoriels, probabilistes, de langue, ...). Donner une version possible de la vraisemblance en learning-to-rank.

### **Réponse**

Les modèles de "learning-to-rank" (LTR) sont une approche de recherche d'information qui utilise des techniques de machine learning pour apprendre un modèle de classement directement à partir de données d'entraînement. Ils se différencient des modèles de RI classiques (modèles vectoriels, probabilistes, de langue, etc.) en ce sens qu'ils ne reposent pas sur une représentation fixe des documents et des requêtes ou sur des heuristiques manuellement définies pour déterminer la pertinence. Les modèles LTR sont entraînés à partir de données étiquetées, qui fournissent des jugements de pertinence pour des paires de documents et de requêtes. L'objectif des modèles LTR est d'apprendre à prédire la pertinence d'un document pour une requête donnée en fonction des caractéristiques de la paire document-requête.

Une version possible de la vraisemblance en learning-to-rank est la maximisation de la log-vraisemblance conditionnelle des rangs observés dans les données d'entraînement. L'objectif est de trouver les paramètres du modèle qui maximisent la probabilité des rangs observés étant donné les caractéristiques des paires document-requête.

## Question 2
Quelles sont les deux familles de modèles neuronaux qui ont été proposées à ce jour en RI ? Expliquer les grandes lignes et leurs différences. Quels sont les avantages/limites de chacunes de ces familles ?

### **Réponse**

Deux familles de modèles neuronaux ont été proposées à ce jour en RI :

1. Modèles basés sur la représentation distribuée : 

Ces modèles, tels que les réseaux de neurones convolutifs (CNN) et les réseaux de neurones récurrents (RNN), apprennent des représentations distribuées des documents et des requêtes en se basant sur l'apprentissage de caractéristiques locales ou séquentielles. Les CNN sont particulièrement adaptés pour apprendre des caractéristiques locales dans les données, tandis que les RNN sont adaptés pour apprendre des dépendances séquentielles à long terme. Ces modèles calculent ensuite la similarité entre les représentations apprises des documents et des requêtes pour estimer la pertinence.

**Avantages** : Ils sont capables de capturer des caractéristiques complexes et des dépendances à long terme dans les données. Ils peuvent également apprendre des représentations sémantiquement significatives des documents et des requêtes.

**Limites** : Ils peuvent être coûteux en termes de calcul et nécessiter des ensembles de données d'entraînement importants. De plus, l'interprétabilité du modèle peut être difficile en raison de la nature complexe des représentations apprises.

2. Modèles basés sur l'attention : 

Ces modèles, tels que les Transformers, apprennent à pondérer l'importance des différents mots ou phrases dans un document ou une requête en fonction de leur pertinence pour la tâche de recherche. L'attention permet à ces modèles de se concentrer sur les parties les plus pertinentes d'un document ou d'une requête pour estimer la pertinence.

**Avantages** : Ils peuvent capturer des dépendances à longue distance et des relations hiérarchiques dans les données. De plus, ils sont plus faciles à paralléliser que les modèles récurrents, ce qui permet un traitement plus rapide et une formation plus efficace.

**Limites** : Comme pour les modèles basés sur la représentation distribuée, les modèles basés sur l'attention peuvent être coûteux en termes de calcul et nécessiter des ensembles de données d'entraînement importants. De plus, bien que l'attention puisse fournir une certaine interprétabilité en mettant en évidence les parties pertinentes des documents et des requêtes, les modèles eux-mêmes peuvent être complexes et difficiles à interpréter dans leur ensemble. Enfin, les modèles basés sur l'attention peuvent être sensibles au bruit et aux artefacts dans les données, ce qui peut affecter leur performance.

# Exercice 6 : classiffcation de sentiments

## Question 1
On hésite entre une représentation en sac de mots et une représentation en tri-grammes de lettres. Quels sont les avantages et inconvénients de chacune des représentations ? (par exemple, en terme de taille, de bruit généré, d'interprétabilité...)

### **Réponse**

Représentation en sac de mots :

- **Avantages** : Simple à mettre en œuvre, facile à interpréter, conserve la fréquence des mots.
- **Inconvénients** : Ne capture pas l'ordre des mots, génère des vecteurs de grande taille, peut être sensible au bruit.

Représentation en tri-grammes de lettres :

- **Avantages** : Capture les motifs locaux et les sous-chaînes fréquentes, réduit la taille du vocabulaire, résilient aux fautes d'orthographe.
- **Inconvénients** : Peut générer du bruit, perd la signification des mots complets, moins interprétable.

## Question 2
Etant donnée la nature particulière de ce problème, quel choix de représentation du texte feriez-vous et pourquoi ? Indiquez quelques pré-traitements qui vous semblent utiles et quelques-uns que vous éviteriez ici. Que dire des stop-words tels que would ou should ? Utiliseriez-vous la même représentation pour un problème de classiffcation d'auteurs ?

### **Réponse**

Pour la classification des sentiments, je choisirais la représentation en sac de mots car elle conserve la fréquence des mots, ce qui est important pour la détection des sentiments. Les pré-traitements utiles incluent la tokenisation, la conversion en minuscules et la suppression de la ponctuation. Les stop-words comme "would" ou "should" peuvent être conservés car ils peuvent avoir un impact sur le sentiment d'une phrase. Pour un problème de classification d'auteurs, une représentation différente, comme les n-grammes de mots ou de lettres, pourrait être préférée, car elle peut capturer des motifs spécifiques à un auteur.

## Question 3
Classiquement, les données d'avis utilisateur collectées sur le web présente une échelle de notation sur 5 étoiles. Rappeler la procédure de binarisation classique de la problématique (passage à un problème à 2 classes). Les notes sur internet sont habituellement très favorables au produit, typiquement la distribution des notes s'apparente à quelque chose de la forme : [10, 15, 10, 35, 30]. Il y a donc un problème d'équilibre des classes sur le problème binaire. Quelles sont les consé- quences de ce déséquilibre ? Comment y remédier du point de vue de l'implémentation, de la formulation et de l'évaluation ?

### **Réponse**

Procédure de binarisation classique :

- Notes de 1 à 3 étoiles : classe négative.
- Notes de 4 à 5 étoiles : classe positive.

Conséquences du déséquilibre des classes :

- Les classificateurs peuvent être biaisés vers la classe majoritaire.
- Les performances sur la classe minoritaire peuvent être médiocres.

Solutions :

- Ré-échantillonnage (sur-échantillonnage de la classe minoritaire ou sous-échantillonnage de la classe majoritaire).
- Utilisation de méthodes de pondération des classes dans les classificateurs.
- Utilisation de métriques d'évaluation plus adaptées (F1-score, précision-rappel).

## Question 4
Quels classiffeurs sont classiquement utilisés pour classer ces données ?

### **Réponse**

Classificateurs classiquement utilisés pour ces données :

- Naïve Bayes.
- Régression logistique.
- Machines à vecteurs de support (SVM).
- Réseaux de neurones.

## Question 5
Dans le cadre d'une collaboration avec un linguiste, nous voulons construire un corpus d'adjectifs associés à une polarisation. Nous voulons exploiter le corpus de revues étiquetées pour y arriver. Proposer une procédure en détaillant les étapes par lesquelles vous passeriez.

### **Réponse**

Procédure pour construire un corpus d'adjectifs polarisés :

1. Extraire les adjectifs des revues étiquetées en utilisant des techniques d'analyse de texte et de Part-Of-Speech (POS) tagging.
2. Calculer la fréquence des adjectifs dans les revues positives et négatives.
3. Calculer un score de polarisation pour chaque adjectif (par exemple, en soustrayant la fréquence négative de la fréquence positive).
4. Trier les adjectifs en fonction de leur score de polarisation et sélectionner ceux qui ont des scores élevés (positifs ou négatifs) comme adjectifs polarisés.

## Question 6
La société CA cherche à analyser la polarité des contributions sur Facebook la concernant pour mieux cerner les communautés d'opinions. Quels sont les problèmes qu'elle va rencontrer ? Proposer rapidement une ou deux idées pour faire face à ces problèmes.

### **Réponse**

Problèmes rencontrés lors de l'analyse de la polarité des contributions sur Facebook :

- Le langage informel, les fautes d'orthographe et les émoticônes rendent l'analyse du texte plus difficile.
- Les opinions peuvent être exprimées de manière implicite, sarcastique ou ambigüe, ce qui complique la détection de la polarité.
- Les données peuvent être bruitées et contenir des informations non pertinentes pour l'analyse de sentiment.

Idées pour faire face à ces problèmes :

1. Utiliser des méthodes de prétraitement spécifiques au domaine, telles que la correction d'orthographe, l'expansion des contractions et l'analyse des émoticônes.
2. Utiliser des modèles de classification de sentiment pré-entraînés spécifiquement pour les réseaux sociaux, qui sont plus susceptibles de capturer les particularités du langage informel et des expressions spécifiques à la plateforme.

# Exercice 7 : sémantique
## Question 1
Définir la sémantique du point de vue de l'informatique. Définir le fossé sémantique / semantic gap en même temps.

### **Réponse**

La sémantique, du point de vue de l'informatique, fait référence à l'étude de la signification des mots, des phrases et des textes dans le contexte de leur utilisation. Elle concerne la compréhension et l'interprétation des structures linguistiques et des symboles pour extraire des informations pertinentes et significatives.

Le fossé sémantique, ou "semantic gap", désigne l'écart entre les représentations de bas niveau des données (par exemple, les caractéristiques syntaxiques ou les mots individuels) et les représentations de haut niveau (par exemple, la signification ou le contexte) qui sont plus proches de la compréhension humaine. Le fossé sémantique est un défi majeur dans le domaine de la recherche d'information, du traitement automatique du langage et de l'analyse de texte, car il nécessite de combler cet écart pour obtenir une compréhension plus précise et utile des données.

## Question 2
Rappeler brièvement les philosophies générales et le fonctionnement des algorithmes PLSA/LDA et word2vec (philosophie = objectif + hypothèses pour arriver à cet objectif + éléments marquants de l'algorithme). Donner les principaux hypers-paramètres associés aux deux modèles. Quelles sont les sorties associées aux deux modèles.

### **Réponse**

PLSA (Probabilistic Latent Semantic Analysis) / LDA (Latent Dirichlet Allocation) :

- **Philosophie** : Modéliser les documents comme un mélange de sujets latents, où chaque sujet est représenté par une distribution de mots. Les modèles cherchent à découvrir ces sujets latents et leur répartition dans les documents.
- **Hypothèses** : Les documents sont générés à partir de sujets latents et les mots des documents sont conditionnés par ces sujets.
- **Fonctionnement** : Utilisation de techniques de factorisation matricielle et d'inférence bayésienne pour apprendre les distributions de mots et de sujets.
- **Hyperparamètres** : Nombre de sujets, hyperparamètres de la distribution de Dirichlet (alpha pour les sujets et beta pour les mots).
- **Sorties** : Distributions de mots pour chaque sujet et distribution de sujets pour chaque document.

Word2Vec :

- **Philosophie** : Apprendre des représentations vectorielles des mots (word embeddings) en exploitant les relations contextuelles entre les mots.
- **Hypothèses** : Les mots qui apparaissent dans des contextes similaires sont sémantiquement similaires et devraient avoir des représentations vectorielles similaires.
- **Fonctionnement** : Utilisation d'un réseau de neurones peu profond (CBOW ou Skip-Gram) pour prédire les mots voisins en fonction d'un mot central (ou vice versa), puis extraction des poids du réseau pour obtenir les word embeddings.
- **Hyperparamètres** : Taille du vecteur, fenêtre contextuelle, nombre d'itérations, taux d'apprentissage.
- **Sorties** : Représentations vectorielles pour chaque mot dans le vocabulaire (word embeddings).

# Exercice 8 : knowledge graph
On considère le texte suivant :
```
Dr House (House, M.D., puis House) est une série télévisée américaine en 177 épisodes de 43 minutes et répartis sur huit saisons. Elle a été créée par David Shore et sa diffusion s'est déroulée du 16 novembre 2004 au 21 mai 2012 sur le réseau Fox. (Wikipédia)
``` 

Nous souhaitons développer un algorithme de construction de graphe de connaissances. L'idée est de transformer le texte en une série de triplets : { (Dr House, TYPE, série TV), (Dr House, NATIONALITE, américaine), ...}.

## Question 1
Pourquoi être intéressé par une telle transformation ? (rapidement)

### **Réponse**

Une telle transformation, qui extrait les informations clés sous forme de triplets, permet une meilleure compréhension et une manipulation plus aisée des données. Les graphes de connaissances facilitent la recherche d'informations, les recommandations, les analyses de tendances et les prédictions, en représentant les relations entre les entités de manière structurée et interprétable.

## Question 2
Quelles sont les problématiques en jeu ?

### **Réponse**

Les problématiques en jeu incluent :

1. L'extraction d'entités : identifier les entités pertinentes dans le texte (par exemple, "Dr House", "David Shore", "Fox").
2. La détection des relations : déterminer les relations entre les entités extraites (par exemple, "Dr House" est de type "série TV", "Dr House" est d'origine "américaine").
3. La désambiguïsation des entités : résoudre les ambiguïtés pour les entités qui ont des noms similaires ou identiques, en identifiant l'entité correcte dans le contexte donné.
4. La normalisation des entités et des relations : standardiser les noms et les relations pour faciliter la comparaison et l'intégration des données.


## Question 3
En imaginant que vous deviez concevoir un tel système, comment procéder ? Donner quelques grandes étapes pour la construction des jeux de données d'apprentissage permettant d'entrainer les modèles attaquant les problématiques mentionnées dans la question précédente.

### **Réponse**

Pour concevoir un tel système, les grandes étapes pourraient être les suivantes :

1. Collecte et prétraitement des données : rassembler des textes pertinents et les préparer en supprimant le bruit, en corrigeant les erreurs et en normalisant le texte.
2. Annotation des données : annoter manuellement les entités et les relations dans un sous-ensemble des textes pour créer un ensemble d'apprentissage. Les annotations doivent être réalisées par des experts ou des personnes familiarisées avec le domaine.
3. Entraînement des modèles : entraîner des modèles de machine learning ou de deep learning pour la reconnaissance d'entités nommées (NER) et l'extraction de relations en utilisant l'ensemble d'apprentissage annoté.
4. Évaluation et optimisation : évaluer la performance des modèles sur un ensemble de test distinct et ajuster les hyperparamètres pour améliorer la précision et le rappel.
5. Application du modèle : utiliser les modèles entraînés pour extraire les entités et les relations à partir de nouveaux textes, puis construire le graphe de connaissances en utilisant les triplets obtenus.

# Exercice 9 : cas d'usage

Dans le temps qui vous reste après les nombreuses questions précédentes, imaginez une idée clé permettant de créer une start-up florissante [basée sur le NLP].

Après avoir énoncé cette idée, décrire les différentes étapes pour créer le système visé : les données nécessaires, celles à collecter sur le web, celles qui peuvent être obtenues en crowd-sourcing avec des systèmes tel que Amazon Mechanical Turk ; décrire les techniques de machine-learning à mettre en oeuvre ; décrire la méthodologie d'évaluation...

### **Réponse**

***Idée clé*** : Créer une plateforme de recommandation de contenu personnalisé (articles, vidéos, podcasts) en utilisant le NLP pour analyser les préférences et les intérêts des utilisateurs.

Étapes pour créer le système :

1. **Collecte de données** : Rassembler un large éventail de contenus (articles, vidéos, podcasts) provenant de sources diverses sur le web. Obtenir des données utilisateur telles que les historiques de navigation, les évaluations et les commentaires, les abonnements aux chaînes, etc. Les données peuvent également être collectées en utilisant des API de plateformes de médias sociaux ou en collaboration avec des partenaires de contenu.
2. **Prétraitement des données** : Nettoyer et préparer les données en supprimant le bruit, en corrigeant les erreurs et en normalisant le texte. Segmenter les données utilisateur en préférences et intérêts spécifiques pour faciliter l'analyse.
3. **Analyse du contenu** : Utiliser des techniques de NLP telles que la tokenisation, l'analyse syntaxique et sémantique, et l'extraction de sujets pour comprendre le contenu et le contexte des articles, vidéos et podcasts collectés.
4. **Analyse des préférences des utilisateurs** : Appliquer des modèles de NLP pour déterminer les centres d'intérêt des utilisateurs en fonction de leurs données d'utilisation, de leurs évaluations et de leurs commentaires. Ces préférences peuvent être représentées sous forme de vecteurs pour faciliter la comparaison et l'analyse.
5. **Création de profils d'utilisateurs** : Construire des profils d'utilisateurs basés sur leurs préférences et intérêts identifiés. Ces profils peuvent être utilisés pour personnaliser les recommandations de contenu.
6. **Modèles de recommandation** : Entraîner des modèles de machine learning pour recommander du contenu aux utilisateurs en fonction de la similarité entre les profils d'utilisateurs et les caractéristiques du contenu. Les modèles de filtrage collaboratif, basés sur le contenu ou hybrides peuvent être utilisés.
7. **Évaluation et optimisation** : Utiliser des méthodes d'évaluation telles que la précision, le rappel, la mesure F1 et le taux d'erreur pour évaluer la performance des modèles de recommandation. Optimiser les modèles en ajustant les hyperparamètres et en utilisant des techniques d'apprentissage en ligne pour mettre à jour continuellement les modèles en fonction des nouvelles données.
8. **Plateforme de déploiement** : Développer une plateforme conviviale et accessible pour permettre aux utilisateurs de découvrir et de consommer du contenu recommandé, et de fournir des commentaires pour affiner leurs préférences et améliorer les recommandations.
9. **Collecte de données via crowd-sourcing** : Utiliser des plateformes telles qu'Amazon Mechanical Turk pour obtenir des annotations et des évaluations de contenu, pour aider à la vérification des résultats des modèles NLP et pour améliorer la qualité des recommandations.

En mettant en œuvre ces étapes, la start-up pourrait offrir des recommandations de contenu personnalisées et pertinentes, ce qui permettrait d'attirer et de fidéliser les utilisateurs, tout en générant des revenus grâce à des partenariats avec des créateurs de









