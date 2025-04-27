#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256  // Optimal block size for improved performance

__global__ void vec_floorf (size_t n, float *result, float  *x)
{
    int id = threadIdx.x + blockIdx.x * BLOCK_SIZE;
    int stride = BLOCK_SIZE * gridDim.x;

    // Loop over elements with stride for better utilization
    for (int i = id; i < n; i += stride) 
    {
        result[i] = floorf(x[i]);
    }
}