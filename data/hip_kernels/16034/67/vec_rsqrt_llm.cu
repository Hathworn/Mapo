#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function for better performance and readability
__global__ void vec_rsqrt(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // 1D indexing for better utilization
    if (id < n) {
        result[id] = rsqrt(x[id]);
    }
}