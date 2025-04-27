#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void checkAggregationFillAggregates(int size, int *adjIndices, int *adjacency, int* aggregation, int* valuesIn, int* valuesOut, int* incomplete) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < size) {
        int currentVal = valuesIn[idx];
        int currentAgg = aggregation[idx];
        int start = adjIndices[idx];
        int end = adjIndices[idx + 1];

        // Use shared memory to cache data
        __shared__ int sharedValuesIn[256];

        // Load values into shared memory for faster access
        if (threadIdx.x < size) {
            sharedValuesIn[threadIdx.x] = valuesIn[threadIdx.x];
        }
        __syncthreads(); // Ensure shared memory is populated

        for (int i = start; i < end; i++) {
            int neighborIdx = adjacency[i];
            int neighborAgg = aggregation[neighborIdx];
            int neighborVal = sharedValuesIn[neighborIdx]; // Use shared memory

            if (neighborAgg == currentAgg && neighborVal > currentVal) {
                currentVal = neighborVal;
                atomicExch(incomplete, 1); // Use atomic operation for thread safety
            }
        }

        valuesOut[idx] = currentVal;
    }
}