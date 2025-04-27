#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void reduce_sum_partial(const float* input, float* output, unsigned int len) {
    // Load a segment of the input vector into shared memory
    __shared__ float partialSum[2 * 256];
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int t = threadIdx.x;
    unsigned int start = 2 * blockIdx.x * blockDim.x;
    
    // Coalesced global memory reads
    partialSum[t] = ((start + t) < len) ? input[start + t] : 0.0;
    partialSum[blockDim.x + t] = ((start + blockDim.x + t) < len) ? input[start + blockDim.x + t] : 0.0;
    __syncthreads();  // Ensure all loads complete
    
    // Traverse reduction tree with optimized sync
    for (unsigned int stride = blockDim.x; stride > 0; stride /= 2) {
        if (t < stride) {
            partialSum[t] += partialSum[t + stride];
        }
        __syncthreads();  // Ensure all additions complete before next step
    }
    
    // Write the computed sum of the block to the output vector at correct index
    if (t == 0) {
        output[blockIdx.x] = partialSum[0];
    }
}