#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Using loop unrolling for optimization.
    if (idx < N) 
    {
        a[idx] = a[idx] * a[idx];
        if (idx + blockDim.x < N) a[idx + blockDim.x] = a[idx + blockDim.x] * a[idx + blockDim.x];
        if (idx + 2 * blockDim.x < N) a[idx + 2 * blockDim.x] = a[idx + 2 * blockDim.x] * a[idx + 2 * blockDim.x];
        if (idx + 3 * blockDim.x < N) a[idx + 3 * blockDim.x] = a[idx + 3 * blockDim.x] * a[idx + 3 * blockDim.x];
    }
}