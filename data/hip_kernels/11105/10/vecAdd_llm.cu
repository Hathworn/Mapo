#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecAdd(float* __restrict__ d_A, float* __restrict__ d_B, float* __restrict__ d_C) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    if (i < TAM) {
        // Use registers to hold the values, minimizing global memory access
        float a_val = d_A[i];
        float b_val = d_B[i];
        d_C[i] = a_val + b_val;
    }
}