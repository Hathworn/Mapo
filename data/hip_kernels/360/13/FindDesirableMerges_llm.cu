#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindDesirableMerges(int size, int minSize, int maxSize, bool force, int* adjIndices, int* adjacency, int* partSizes, int* desiredMerges, int* merging) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= size) return; // Simplified boundary check

    if (merging[idx] == 1) return; // Skip active aggregates early

    // Cache current size to register
    int currentSize = partSizes[idx];
    int checkedNeighbors = 0;
    float bestDesirability = 0.0f;
    int mostDesirable = -1;
    int start = adjIndices[idx];
    int end = adjIndices[idx + 1];

    for (int i = start; i < end; i++) {
        int neighborAgg = adjacency[i];
        
        if (merging[neighborAgg] == 1) continue; // Skip active neighbors early

        checkedNeighbors++;
        int neighborSize = partSizes[neighborAgg];
        
        // Compute desirability with branchless operations
        float desirability = max(0.0f, minSize - currentSize) + max(0.0f, minSize - neighborSize);
        int totalSize = currentSize + neighborSize;
        desirability *= (totalSize > maxSize && !force) ? 0.0f : 1.0f / max(1.0f, totalSize - maxSize);

        // Update most desirable neighbor
        if (desirability > bestDesirability) {
            bestDesirability = desirability;
            mostDesirable = neighborAgg;
        }
    }

    if (mostDesirable == -1) merging[idx] = 1; // Mark aggregate as active if no desirable merges found

    // Log only if force is true and most desirable merge was not found
    if (currentSize < minSize && force && mostDesirable == -1)
        printf("Aggregate %d is too small but found no merges! %d / %d neighbors checked.\n", idx, checkedNeighbors, end - start);

    desiredMerges[idx] = mostDesirable; // Update desired merges
}