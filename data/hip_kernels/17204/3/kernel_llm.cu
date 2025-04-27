#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float* red, float* green, float* blue, unsigned long N){

    // Calculate global thread ID in one step
    unsigned long tid = blockIdx.y * blockDim.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;

    if(tid < N){
        red[tid] = .5f;  // Use 'f' suffix for float literals
        blue[tid] = .7f;
        green[tid] = .2f;
    }
}