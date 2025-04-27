#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for subtracting a scalar from a vector
__global__ void vec_scalarSub(int n, double *result, double x, double *y) {
    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure within bounds
    if (id < n) {
        result[id] = x - y[id]; // Perform subtraction
    }
}