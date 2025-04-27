#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Use a more efficient block index calculation
    int idx = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;
    if (idx < N)
    {
        float val = a[idx]; // Load value once
        a[idx] = val * val; // Square the value
    }
}