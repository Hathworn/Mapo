#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void x15(float* x16, float* x17, float* x18, int x19) {
    // Calculate the global thread index once
    int x21 = threadIdx.x + blockIdx.x * blockDim.x;

    // Use strided loop for all thread calculations in parallel
    for (int x22 = x21; x22 < x19; x22 += gridDim.x * blockDim.x) {
        // Perform subtraction and store the result
        x18[x22] = x16[x22] - x17[x22];
    }
}