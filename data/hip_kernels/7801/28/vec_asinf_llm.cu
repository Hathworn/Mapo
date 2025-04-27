#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize vec_asinf kernel function
__global__ void vec_asinf (size_t n, float *result, float *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary to avoid unnecessary computation
    if (id < n) {
        result[id] = asinf(x[id]);
    }
}