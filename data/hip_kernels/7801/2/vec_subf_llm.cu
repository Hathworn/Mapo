#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vec_subf (size_t n, float *result, float *x, float *y)
{
    // Compute global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop to ensure all elements are processed even if grid size < n
    for (int i = id; i < n; i += blockDim.x * gridDim.x) {
        result[i] = x[i] - y[i];
    }
}