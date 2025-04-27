#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _adagrad(int n, float eps, float *dw2, float *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Optimize: Calculate stride once to reduce repeated computation
    while (i < n) {
        float dwi = dw[i]; // Optimize: Load dw[i] into a register to reduce global memory access
        float dwi2 = dwi * dwi; // Optimize: Compute square and reuse value
        dw2[i] += dwi2;
        dw[i] = dwi / (eps + sqrt(dw2[i])); // Optimize: Reuse dwi for division
        i += stride;
    }
}