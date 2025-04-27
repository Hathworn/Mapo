#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices() {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    double sqrt_val = sqrt((double)id); // Precompute sqrt to avoid recalculation
    printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\n",
           blockDim.y, threadIdx.x, blockIdx.x, blockDim.x, id, sqrt_val);
    // Removed __syncthreads(); as it is unnecessary in this context
}