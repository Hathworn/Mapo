#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use built-in __powf to optimize power calculation
    if (idx < N) a[idx] = __powf(a[idx], 2.0f);
}