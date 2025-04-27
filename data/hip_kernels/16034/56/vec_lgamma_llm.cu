#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimize global kernel function for better performance
__global__ void vec_lgamma(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flatten 1D grid and block indexing
    if (id < n) {
        result[id] = lgamma(x[id]);
    }
}