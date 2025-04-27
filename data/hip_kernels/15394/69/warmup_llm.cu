#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate k only if within bounds
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        unsigned int k = i + offset;
        if (k < n) {
            C[i] = A[k] + B[k]; // Optimize memory access
        }
    }
}