#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void allocateNodesKernel(int size, int *adjIndexes, int *adjacency, int *partIn, int *partOut, int *aggregated) {
    // Calculate the unique index for each thread.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the index is within the size.
    if (idx < size) {
        // Proceed if the node is not aggregated yet.
        if (aggregated[idx] == 0) {
            int start = adjIndexes[idx];
            int end = adjIndexes[idx + 1];

            // Use shared memory for faster access and to reduce global memory reads.
            __shared__ int candidates[10];
            __shared__ int candidateCounts[10];

            // Initialize first 10 elements (threads 0-9).
            if (threadIdx.x < 10) {
                candidates[threadIdx.x] = -1;
                candidateCounts[threadIdx.x] = 0;
            }

            // Synchronize to make sure initialization is complete.
            __syncthreads();
            
            // Iterate over the node's neighbors
            for (int i = start; i < end; i++) {
                int candidate = partIn[adjacency[i]];
                if (candidate != -1) {
                    bool inserted = false;
                    
                    for (int j = 0; j < 10 && !inserted; j++) {
                        if (candidates[j] == candidate) {
                            atomicAdd(&candidateCounts[j], 1);  // Use atomic for safe increments.
                            inserted = true;
                        } else if (candidates[j] == -1) {
                            candidates[j] = candidate;
                            atomicAdd(&candidateCounts[j], 1);  // Use atomic for safe increments.
                            inserted = true;
                        }
                    }
                }
            }

            // More synchronizations to ensure all candidate counts have been updated.
            __syncthreads();

            // Determine the candidate with the most connections.
            if (threadIdx.x == 0) {
                int addTo = candidates[0];
                int count = candidateCounts[0];
                for (int i = 1; i < 10; i++) {
                    if (candidateCounts[i] > count) {
                        count = candidateCounts[i];
                        addTo = candidates[i];
                    }
                }
                
                // Assign the node to the most connected aggregate.
                partOut[idx] = addTo;
                if (addTo != -1) {
                    aggregated[idx] = 1;
                }
            }
        }
    }
}