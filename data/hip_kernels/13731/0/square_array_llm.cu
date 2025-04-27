#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure idx is within bounds
    if (idx < N) {
        float val = a[idx];
        a[idx] = val * val;
    }
}