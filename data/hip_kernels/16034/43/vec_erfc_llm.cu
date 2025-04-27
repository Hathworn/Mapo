#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"

// Optimized kernel using 1D block and grid mapping
__global__ void vec_erfc(int n, double *result, double *x) {
    // Compute global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check boundary condition
    if (id < n) {
        result[id] = erfc(x[id]);
    }
}