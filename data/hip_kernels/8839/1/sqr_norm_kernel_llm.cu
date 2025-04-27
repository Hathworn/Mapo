#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sqr_norm_kernel(int n, float *out, float *data, float rows, float cols)
{
    extern __shared__ float sdata[];
    // Calculate global thread index
    int globalThreadId = blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x;
    int threadId = 2 * globalThreadId;

    int i = threadIdx.y * blockDim.x + threadIdx.x;
    
    // Initialize shared memory data
    sdata[i] = 0;
    
    // Perform calculations
    if(threadId + 1 < n) { // Ensure within bounds
        sdata[i] = data[threadId] * data[threadId] + data[threadId + 1] * data[threadId + 1];
    }
    __syncthreads();

    // Reduce within block
    for (unsigned int s = blockDim.x * blockDim.y / 2; s > 0; s >>= 1) {
        if (i < s) {
            sdata[i] += sdata[i + s];
        }
        __syncthreads();
    }

    // Store result of reduction
    if (i == 0) {
        atomicAdd(&out[blockIdx.x], sdata[0] / (rows * cols));
    }
}