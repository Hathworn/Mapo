#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices() {
    // Calculate unique thread ID within the grid
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    double id_sqrt = sqrt((double)id); // Compute square root once and save result

    // Optimized by removing unnecessary synchronization call
    printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id: %d raiz: %f\n",
           blockDim.y, threadIdx.x, blockIdx.x, blockDim.x, id, id_sqrt);
}