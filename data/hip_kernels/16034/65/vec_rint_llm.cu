#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to round input to the nearest integer value in floating-point
__global__ void vec_rint(int n, double *result, double *x) {
    // Calculate 1D global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Only process valid array index
    if (id < n) {
        result[id] = rint(x[id]);
    }
}