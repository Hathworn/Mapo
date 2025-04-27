#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized vec_tanh kernel
__global__ void vec_tanh(int n, double *result, double *x) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D block and grid for better performance
    if (id < n) {
        result[id] = tanh(x[id]);
    }
}