#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void max(int* input, int* maxOut) {
    // Calculate global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop unrolling for improved performance
    for(int offset = idx; offset < 100; offset += stride){
        atomicMax(maxOut, input[offset]);
        printf("NUM:%d Thread: %d ||\n", input[offset], idx);
    }
}