#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FindDesirableMergeSplits(int size, int minSize, int maxSize, int desiredSize, int* adjIndices, int* adjacency, int* partSizes, int* desiredMerges, int* merging) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        // Skip active aggregates (already merged or unmergeable)
        if (merging[idx] != 1) {
            int currentSize = partSizes[idx];
            bool currentOutSized = currentSize < minSize || currentSize > maxSize;
            float bestDesirability = 0;
            int mostDesirable = -1;
            int start = adjIndices[idx];
            int end = adjIndices[idx + 1];

            for (int i = start; i < end; i++) {
                int neighborAgg = adjacency[i];

                // Consider only active neighbor aggregates
                if (merging[neighborAgg] != 1) {
                    int neighborSize = partSizes[neighborAgg];
                    bool neighborOutSized = neighborSize < minSize || neighborSize > maxSize;
                    int totalSize = currentSize + neighborSize;

                    // Calculate desirability for legal pairs
                    bool legalPair = (neighborOutSized || currentOutSized) && totalSize > minSize * 2 && totalSize < maxSize * 2;
                    float desirability = legalPair ? 1.0f / abs(desiredSize - totalSize) : 0;

                    // Update most desirable neighbor
                    if (desirability > bestDesirability) {
                        bestDesirability = desirability;
                        mostDesirable = neighborAgg;
                    }
                }
            }

            if (mostDesirable == -1) {
                merging[idx] = 1;
            }

            desiredMerges[idx] = mostDesirable;
        }
    }
}