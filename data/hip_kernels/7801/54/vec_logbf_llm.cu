#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized vector logbf function
__global__ void vec_logbf(size_t n, float *result, float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride for loop unrolling
    for (int i = id; i < n; i += stride)
    {
        result[i] = logbf(x[i]); // Process elements in a loop with stride
    }
}