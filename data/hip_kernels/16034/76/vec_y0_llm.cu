#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_y0 (int n, double *result, double *x)
{
    // Use a single thread index for better memory coalescing
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensuring the index is within the range
    if (id < n) {
        result[id] = y0(x[id]);
    }
}