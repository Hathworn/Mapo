#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void x2(float* x3, float x4, int x5) {
    // Calculate the global thread index
    int x7 = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop over each stride within the grid
    for (; x7 < x5; x7 += blockDim.x * gridDim.x) {
        x3[x7] = x4;
    }
}