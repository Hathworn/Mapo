#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    // Simplify thread index calculation using a single variable
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a more efficient loop condition
    if (tid < size) {
        out[tid] += in1[tid] * in2[tid];
    }
}