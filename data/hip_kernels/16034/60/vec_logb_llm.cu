#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with 1D grid and block indexing
__global__ void vec_logb (int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    if (id < n) {
        result[id] = logb(x[id]);
    }
}