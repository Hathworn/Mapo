#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findDesirabilityKernel(int size, int optimalSize, int *adjIndexes, int *adjacency, int *partition, int *partSizes, int *nodeWeights, int *swap_to, int *swap_from, int *swap_index, float *desirability)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx < size)
    {
        int currentPart = partition[idx];
        int currentPartSize = partSizes[currentPart];
        int nodeSize = nodeWeights[idx];
        int selfAdjacency = 0;
        int addTo = -1;
        float bestDesirability = 0;

        // The currentWeightFactor is higher the farther the count is from average
        float currentWeightFactor = (float)abs(currentPartSize - optimalSize) / optimalSize;
        // The self improvement is a measure of how much better this partitions size will be if the node is gone.
        float selfImprovement = (abs(currentPartSize - optimalSize) - abs((currentPartSize - nodeSize) - optimalSize)) * currentWeightFactor;
        if(selfImprovement > 0)
        {
            int start = adjIndexes[idx];
            int end = adjIndexes[idx + 1];

            // Arrays to store info about neighboring aggregates
            // Optimize candidate arrays to use shared memory for improved access time
            __shared__ int candidates[10];
            __shared__ int candidateCounts[10];
            
            if (threadIdx.x < 10) {
                candidates[threadIdx.x] = -1;
                candidateCounts[threadIdx.x] = 0;
            }
            __syncthreads();

            // Going through the neighbors:
            for(int i = start; i < end; i++)
            {
                int candidate = partition[adjacency[i]];
                if(candidate == currentPart)
                    selfAdjacency++;
                else
                {
                    for(int j = 0; j < 10; j++)
                    {
                        // More efficient checking and updating through shared memory
                        if(candidate != -1 && candidates[j] == -1) {
                            atomicMax(&candidates[j], candidate);
                            atomicAdd(&candidateCounts[j], 1);
                            candidate = -1;
                        } else if(candidates[j] == candidate) {
                            atomicAdd(&candidateCounts[j], 1);
                            candidate = -1;
                        }
                    }
                }
            }

            // Finding the best possible swap:
            for(int i = 1; i < 10; i++)
            {
                if(candidates[i] != -1)
                {
                    int neighborPart = candidates[i];
                    int neighborPartSize = partSizes[neighborPart];
                    float neighborWeightFactor = (float)abs(neighborPartSize - optimalSize) / optimalSize;
                    float neighborImprovement = ((float)(abs(neighborPartSize - optimalSize) - abs((neighborPartSize + nodeSize) - optimalSize))) * neighborWeightFactor;
                    // Combine with self improvement to get net
                    neighborImprovement += selfImprovement;
                    // Multiply by adjacency factor
                    neighborImprovement *= (float)candidateCounts[i] / selfAdjacency;

                    if(neighborImprovement > bestDesirability)
                    {
                        addTo = neighborPart;
                        bestDesirability = neighborImprovement;
                    }
                }
            }
        }

        swap_from[idx] = currentPart;
        swap_index[idx] = idx;
        swap_to[idx] = addTo;
        desirability[idx] = bestDesirability;
    }
}