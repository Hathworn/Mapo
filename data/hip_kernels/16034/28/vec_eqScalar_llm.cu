#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function
__global__ void vec_eqScalar(int n, double *result, double *x, double y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Flatten the index calculation
    if (id < n) {
        result[id] = (x[id] == y) ? 1.0 : 0.0; // Assign comparison result
    }
}