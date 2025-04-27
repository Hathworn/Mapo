#include "hip/hip_runtime.h"
#include "includes.h"

// GPU Libraries

// Macro to handle errors occurred in CUDA api
__device__ void recursiveReduce(int *g_inData, int *g_outData, int inSize, int outSize)
{
    extern __shared__ int sData[];

    // Identification
    unsigned int tId = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize
    sData[tId] = 0;

    __syncthreads();

    // Fill up the shared memory
    if (i < inSize) { // Ensure within bounds 
        sData[tId] = g_inData[i];
    }

    __syncthreads();

    // Tree based reduction
    for (unsigned int d = blockDim.x / 2; d > 0; d /= 2) { // Use half-interval step 
        if (tId < d) // Only necessary threads
            sData[tId] += sData[tId + d];

        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tId == 0) {
        g_outData[blockIdx.x] = sData[0];
    }

    // Recursive call
    if (outSize > 1 && blockIdx.x == 0 && tId == 0) { // Ensure only one recursive call
        // Kernel Launch
        recursiveReduce(g_outData, g_outData, outSize, (outSize - 1) / blockDim.x + 1);
    }
}

__global__ void reduceKernel(int *g_inData, int *g_outData, int inSize, int outSize)
{
    recursiveReduce(g_inData, g_outData, inSize, outSize);
}