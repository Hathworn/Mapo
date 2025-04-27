#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimize global kernel function to use 1D grid only
__global__ void vec_fmin(int n, double *result, double *x, double *y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D indexing
    if (id < n) {
        result[id] = fmin(x[id], y[id]); // Perform vector minimum calculation
    }
}