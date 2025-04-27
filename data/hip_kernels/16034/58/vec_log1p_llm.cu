#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_log1p(int n, double *result, double *x) {
    // Efficient thread id calculation using flattened 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if id is within bounds
    if (id < n) {
        result[id] = log1p(x[id]); // Compute log1p for valid id
    }
}