#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel 
__global__ void vec_gtScalar(int n, double *result, double *x, double y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified ID computation
    if (id < n) {
        result[id] = (x[id] > y) ? 1.0 : 0.0;  // Use ternary operation for comparison
    }
}