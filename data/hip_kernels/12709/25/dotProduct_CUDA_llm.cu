#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotProduct_CUDA(double *sum, long size, double *vector1, double *vector2) {
    long idx = blockIdx.x * blockDim.x + threadIdx.x; // Sequential thread index across threads
    if (idx < size) {
        // Perform element-wise multiplication directly
        sum[idx] = vector2[idx] * vector1[idx];
    }
}