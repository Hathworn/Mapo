#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float* red, float* green, float* blue, unsigned long N){

    unsigned long tid = blockIdx.x * blockDim.x + threadIdx.x + 
                        (blockIdx.y * blockDim.y + threadIdx.y) * blockDim.x * gridDim.x;

    // Check tid and set values if within bounds
    if(tid < N){
        red[tid] = 0.5f;
        green[tid] = 0.2f;
        blue[tid] = 0.7f;
    }
}