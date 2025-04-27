#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING: device_sum size should be gridDim.x
__global__ void vec_exp2 (int n, double *result, double *x)
{
    // Compute unique thread index for 1D grid
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < n) {
        // Calculate exp2 for the input at this specific index
        result[id] = exp2(x[id]);
    }
}