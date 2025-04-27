#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by reducing redundant index calculations
__global__ void vec_ltScalar(int n, double *result, double *x, double y) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Use 1D indexing to simplify computation
    while (id < n) {
        result[id] = (x[id] < y) ? 1.0 : 0.0;
        id += blockDim.x * gridDim.x;  // Move to next element in grid
    }
}