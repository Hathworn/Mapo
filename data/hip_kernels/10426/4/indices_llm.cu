#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices(){
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Print conditionally to reduce overhead in large-scale executions
    if (id < blockDim.x * gridDim.x) {
        printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\n",
               blockDim.y, threadIdx.x, blockIdx.x, blockDim.x, id, sqrt((double)id));
    }

    // __syncthreads() is unnecessary here since no shared memory is altered
}