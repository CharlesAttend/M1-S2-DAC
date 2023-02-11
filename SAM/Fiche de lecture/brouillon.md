# Data exploration and scale 

# Machine learning for reimagining data platform components. 

Recent advances in ML have inspired our community to reflect on how data engine components could potentially use ML to significantly advance the state of the art. The most obvious such opportunity is auto tuning. Database systems can systematically replace "magic numbers" and thresholds with ML models to auto-tune system configurations. Availability of ample training data also provides opportunities to explore new approaches that take advantage of ML for query optimization or multidimensional index structures, especially as state-of-the-art solutions to these problems have seen only modest improvements in the last two decades. ML-model driven engine components must demonstrate significant benefits as well as robustness when test data or test queries deviate from the training data and training queries. To handle such deviations, the ML models need to be augmented with guardrails so that the system degrades gracefully. Furthermore, a well-thought-out software engineering pipeline to support the life cycle of a ML-model driven component will be important.


**The cloud offers an opportunity to rethink databases in a world with an abundance of resources that can be pooled together. However, it is critical to efficiently support multitenancy to control costs and optimize utilization.**

# Machine learning workloads

Modern data management workloads include ML, which adds an important, new requirement for database engines. While ML workloads include training as well as inferencing, supporting the latter efficiently is an immediate need. Today the challenge of efficiently supporting "in-database" inferencing is achieved by leveraging database extensibility mechanisms. As we look forward, the ML models that are invoked as part of inferencing, must be treated as first-class citizens inside databases. ML models may be browsed and queried as database objects and database systems need to support popular ML programming frameworks. While today's database systems can support inferencing over relatively simple models, the increasing popularity and effectiveness of extremely large models such as BERT and GPT-3 requires database engine developers to leverage heterogeneous hardware and work with architects responsible for building ML infrastructure using FPGAs, GPUs, and specialized ASICs.

# Distributed transactions

Cloud data management systems are increasingly geo-distributed both within a region (across multiple availability zones) and across multiple geographic regions. This has renewed interest in industry and academia on the challenges of processing distributed transactions. The increased complexity and variability of failure scenarios, combined with increased communication latency and performance variability in distributed architectures has resulted in a wide array of trade-offs between consistency, isolation level, availability, latency, throughput under contention, elasticity, and scalability. There is an ongoing debate between two schools of thought: (a) Distributed transactions are hard to process at scale with high throughput and availability and low latency without giving up some traditional transactional guarantees. Therefore, consistency and isolation guarantees are reduced at the expense of increased developer complexity. (b) The complexity of implementing a bug-free application is extremely high unless the system guarantees strong consistency and isolation. Therefore, the system should offer the best throughput, availability, and low-latency service it can, without sacrificing correctness guarantees. This debate will likely not be fully resolved anytime soon, and industry will offer systems consistent with each school of thought. However, it is critical that application bugs and limitations in practice that result from weaker system guarantees be better identified and quantified, and tools be built to help application developers using both types of system achieve their correctness and performance goals.





# Metadata management

Our community can advance the state of the art for the tracking and managing metadata related to data science experiments and ML models. This includes automated labeling and annotations of data, such as identification of data types. Metadata annotations as well as provenance need to be searchable to support experimentation with different models and model versioning. Data provenance could be helpful to determine when to retrain models. Another metadata challenge is minimizing the cost of modifying applications as a schema evolves, an old problem where better solutions continue to be needed. The existing academic solutions to schema evolution are hardly used in practice.

# Data governance

Consumers and enterprises are generating data at an unprecedented rate. Our homes have smart devices, our medical records are digitized, and social media is publicly available. All data producers (consumers and enterprises) have an interest in constraining how their data is used by applications while maximizing its utility, including controlled sharing of data. For instance, a set of users might allow the use of their personal health records for medical research, but not for military applications. Data governance is a suite of technologies that supports such specifications and their enforcement. We now discuss three key facets of data governance that participants in the Seattle Database meeting thought deserves more attention. Much like data science, the database community needs to work together with other communities that share interest in these important concerns to bring transformative changes.

# Data use policy

The European Union's General Data Protection Regulation (GDPR) is a prime example of such a directive. To implement GDPR and similar data use policy, metadata annotations and provenance must accompany data items as data is shared, moved, or copied according to a data use policy. Another essential element of data governance is auditing to ensure data is used by the right people for the right purpose per the data usage policy. Since data volumes continue to rise sharply, scalability of such auditing techniques is critically important. Much work is also needed to develop a framework for data collection, data retention and data disposal that supports policy constraints and will enable research on the trade-off between utility of data and limiting data gathering. Such a framework can also help answer when data may be safely discarded given a set of data usage goals.

# Data privacy

A very important pillar of data governance is data privacy. In addition to cryptographic techniques to keep the data private, data privacy includes the challenges of ensuring that aggregation and other data analytic techniques may be applied effectively on a data set without revealing any individual member of the dataset. Although models such as differential privacy and local differential privacy address these challenges, more work is needed to understand how best to take advantage of these models in database platforms without significantly restricting the class of query expressions. Likewise, enabling efficient multiparty computation to enable data sharing across organizations without sacrificing privacy is an important challenge.

# Ethical data science

Challenges in countering bias and discrimination in leveraging data science techniques, especially for ML, have gained traction in research and practice. The bias often comes from the input data itself such as when insufficiently representative data is used to train models. We need to work with other research communities to help mitigate this challenge. Responsible data management has emerged recently as a new research direction for the community and contributes to the interdisciplinary research in the broader area of Fairness, Accountability, Transparency, and Ethics (FATE).


==============================================


The database community has been impacted by the acceleration of technological breakthroughs in machine learning and data science, the rise of data governance, the growth of managed cloud data systems, the acceleration of the Industrial Internet-of-Things, and changes in hardware. Those advenues conduct to some new research challenges. 

I did note understand all the document but here is my top five, that are link with our Masters and with SAM and that I can relate with.


**Data exploration and scale** This point discusses the recent advances in machine learning (ML) and how it can be used to reimagine the data platform components. The focus is on auto tuning. It is describe as the way database systems can replace magic numbers and thresholds with ML models, and on exploring new approaches to query optimization or multidimensional index structures. *I like the idea to implement ML in database system.*

**Machine learning workloads** This section discusses the importance of ML in modern data management workloads and the need for database engines to support in-database  inferencing/training efficiently. To support this, it also highlights the need for database systems to support popular ML programming frameworks such as Pytorch or Tensorflow. This support already exist but only for small ML model, train much bigger AI like language model will requires database engine developers to cooperate with data scientist and hardware developper. *I nether thought about the way those terabyte of data for language model was managed. I like the way the document said it will need cooperation between researcher and developper of differents fields*

**Distributed transactions** This section addresses the challenges of processing distributed transactions in cloud data management systems, which are increasingly geo-distributed across multiple geographic regions. There is a debate between two schools of thought, one advocating for reducing consistency and isolation guarantees for high throughput, availability, and low latency, and the other advocating for strong consistency and isolation guarantees. The section emphasizes the importance of better identifying and quantifying application bugs and limitations, and building tools to help application developers achieve their goals. *Descentralisation is on-trend and I didn't know that it still was a real problem to have distributed transaction. I think we need to adress it quick*

The last two points are a around data governance, metadata management and ethical data science. I'll first define those research challenges, them explain the link between them. 

* Metadata management involves tracking and managing metadata related to data science experiments and ML models, including automated labeling and annotations of data and data provenance. 
* Data governance involves the control of how data is used by applications, with the European Union's General Data Protection Regulation (GDPR) being a prime example. 
* Ethical data science involves countering bias and discrimination in the use of data science techniques, with responsible data management emerging as a new research direction in the area of Fairness, Accountability, Transparency, and Ethics (FATE).

I think those challenges are dependent to each other, kind of a domino effect. To improve ethical data science and data governance, we need database system to be able to keep track of where the data comes from, especially in data lake that seem to be describe as a bit messy. That's where metadata management are involves.

