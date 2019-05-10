# Outline

1. What is a community?

2. Why is it important for network analysis, in particular bigdata analysis?

3. What general class of algorithms are available to us?
    1. Classes of algorithms
      - Streaming vs Iterative
      - Updating vs Reprocessing
      - 
    2. Algos
      - k-clique
      - graph-partitioning (elaborate)
      - modularity -> comparing a graph with its null model
        - modularity maximization
          - greedy modularity maximization
      - OSLOM
      - Infomap -> Random walks
      - SCD
      - Louvain
      - SCoDA
    3. What are the limitations/tradeoffs between speed, memory, and accuracy?
    
4. How can we evaluate these algorithms?
  1. Qualities of a Community
    - Conductance
      - And variations
      - only works for undirected graphs
    - Motif conductance
      - works for directed graphs
  2. Ground truth communities with F1 score and NMI
    - F1 score
      - Is the harmonic mean of Precision and Recall
      - Used in ML
      - Used in NLP
      - Weakness: Depending on context we may prefer to adjust the weight given to either Precision or Recall.
    - NMI (Normailzed Mutual Information):
5. Known issues
  - Resolution limit problem
    - SCoDA is also prone to this, based on the selection of the parameter d.
    - Claim parallelizability, but due to memory access patterns and branching patterns this can be quite difficult to implement.  Parallelizing also hurts the accuracy of some algorithms.