#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void revisedArraySum(float *array, float *sum) {
    __shared__ float partialSum[256];
    int t = threadIdx.x;
    
    // Initialize the shared memory
    partialSum[t] = array[t];
    __syncthreads();

    // Perform iterative reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (t < stride) {
            partialSum[t] += partialSum[t + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (t == 0) {
        sum[0] = partialSum[0];
    }
}