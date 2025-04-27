#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices() {
    // Calculate the unique thread ID for indexing
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Optimize the loop by removing unnecessary __syncthreads(); it's a simple printf operation
    printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\n",
           blockDim.y, threadIdx.x, blockIdx.x, blockDim.x, id, sqrt((double)id));
}