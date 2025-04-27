#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void stencil_ld(unsigned *in, unsigned *out){
    __shared__ int temp[BLOCK_SIZE + 2*RADIUS];
    int gindex = threadIdx.x + blockIdx.x * blockDim.x;
    int lindex = threadIdx.x;

    // Load main block of data
    temp[lindex + RADIUS] = in[gindex];
    
    // Use only necessary threads to load halo data
    if(threadIdx.x < RADIUS){
        temp[lindex]                  = in[gindex - RADIUS];
        temp[lindex + BLOCK_SIZE + RADIUS] = in[gindex + BLOCK_SIZE];
    }
    
    __syncthreads();

    int result = 0;
    // Calculate result based on stencil
    for(int offset = -RADIUS; offset <= RADIUS; offset++){
        result += temp[lindex + offset + RADIUS];
    }

    // Store the result
    out[gindex] = result;
}