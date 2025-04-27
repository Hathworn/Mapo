#include "hip/hip_runtime.h"
#include "includes.h"

// Define a more complex workload if needed
__global__ void optimizedFunc(int* data, int size) {
    // Use shared memory for frequently accessed data
    __shared__ int sharedData[256];

    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threadId is within bounds
    if(threadId < size) {
        // Load data into shared memory
        sharedData[threadIdx.x] = data[threadId];
        __syncthreads();

        // Add more processing logic using shared data
        // Example processing if needed
        data[threadId] = sharedData[threadIdx.x] * 2;

        __syncthreads();
    }
}