# From the Deep

In this problem, you'll analyze the trade-offs of three different approaches to partitioning data across multiple boats.

## Random Partitioning

Random partitioning ensures an even distribution of observations across all boats regardless of when they are collected, preventing any single boat from becoming overloaded. This approach is simple to implement and maintains balanced storage across the network. However, querying for observations within a specific time range becomes inefficient because the data is scattered across all boats, requiring queries to run on every boat to ensure no observations are missed. This increases query latency and network overhead significantly.

## Partitioning by Hour

Partitioning by hour allows queries for specific time ranges to be highly efficient, as all observations within a given hour are stored on a single boat, eliminating the need to query multiple boats. This approach also makes data organization predictable and intuitive. However, since AquaByte collects most observations between midnight and 1am, Boat A (handling hours 0-7) would receive a disproportionate amount of data, leading to uneven load distribution. This creates a storage bottleneck and potential performance issues on Boat A while other boats remain underutilized.

## Partitioning by Hash Value

Partitioning by hash value achieves even distribution of observations across all boats regardless of collection time patterns, preventing any single boat from being overloaded even when most observations occur at similar times. Additionally, queries for specific observations can be executed efficiently on a single boat by computing the hash value of the target timestamp. However, range queries (such as finding all observations between midnight and 1am) become inefficient because observations within a time range are scattered across all boats based on their hash values, requiring queries to run on every boat in the network.
