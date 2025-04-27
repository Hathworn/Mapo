#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices(){
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Removed __syncthreads(), unnecessary since no shared data
    printf("blockdimy: %d  threadx: %d  Blockidx: %d  blockdimx: %d id:  %d raiz: %f\n",
           blockDim.y, threadIdx.x, blockIdx.x, blockDim.x, id, sqrt((double)id));
}