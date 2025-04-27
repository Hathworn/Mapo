#include "hip/hip_runtime.h"
#include "includes.h"

// Negate elements of vector
__global__ void vec_negatef(size_t n, float *result, const float *x)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    // Use grid-stride loop for better utilization
    for (int i = id; i < n; i += blockDim.x * gridDim.x)
    {
        result[i] = -x[i];
    }
}