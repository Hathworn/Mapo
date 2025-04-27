#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N)
    {
        float temp = a[idx];  // Load once
        a[idx] = temp * temp; // Use register variable
    }
}