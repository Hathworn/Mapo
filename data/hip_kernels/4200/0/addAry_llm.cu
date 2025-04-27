#include "hip/hip_runtime.h"
#include "includes.h"

// Adds two arrays
extern "C" void runCudaPart();

// Main CUDA function
__global__ void addAry(int *ary1, int *ary2) {
    // Calculate global thread index
    int indx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform the addition
    ary1[indx] += ary2[indx];
}