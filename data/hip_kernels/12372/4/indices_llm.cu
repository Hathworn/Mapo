#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void indices() {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Precompute block and thread sizes to avoid multiple accesses
    int blockDimY = blockDim.y;
    int threadX = threadIdx.x;
    int blockIdxX = blockIdx.x;
    int blockDimX = blockDim.x;
    
    // Store sqrt result in a variable to avoid duplicate computation
    double idSqrt = sqrt((double)id);

    // Optimize printf by reusing computed variables
    printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\n",
           blockDimY, threadX, blockIdxX, blockDimX, id, idSqrt);

    __syncthreads();
}