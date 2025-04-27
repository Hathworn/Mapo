#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N)
    {
        // Use register to load memory to reduce redundant accesses
        float value = a[idx];
        a[idx] = value * value;
    }
}