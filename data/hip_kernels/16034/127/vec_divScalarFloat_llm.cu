#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimized kernel for scalar division
__global__ void vec_divScalarFloat(int n, float *result, float *x, float y) {
    // Calculate global thread ID
    int globalId = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform bounds checking
    if (globalId < n) {
        // Divide vector element by scalar
        result[globalId] = x[globalId] / y;
    }
}