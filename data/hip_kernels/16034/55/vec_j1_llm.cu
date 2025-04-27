#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimized kernel function
__global__ void vec_j1(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Use 1D indexing for simplicity
    if (id < n) {
        result[id] = j1(x[id]);  // Compute j1 for the valid range
    }
}