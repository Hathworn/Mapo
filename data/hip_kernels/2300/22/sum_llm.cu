#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const float *input, float *output, int numElements) {
    // Calculate global index for this thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory for partial sums
    __shared__ float partialSum[256]; // Assuming blockDim.x <= 256

    // Initialize partial sum for this thread
    float val = 0.f;

    // Accumulate elements of the array in chunks
    for (int i = index; i < numElements; i += blockDim.x * gridDim.x) {
        val += input[i];
    }

    // Store partial sum in shared memory
    partialSum[threadIdx.x] = val;
    __syncthreads();

    // Reduce partial sums within the block
    if (threadIdx.x == 0) {
        float blockSum = 0.f;
        for (int i = 0; i < blockDim.x; ++i) {
            blockSum += partialSum[i];
        }
        atomicAdd(output, blockSum); // Accumulate block results atomically
    }
}