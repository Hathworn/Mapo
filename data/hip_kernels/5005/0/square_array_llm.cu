#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check if index is within range to prevent out-of-bounds access
    if (idx < N) {
        float value = a[idx]; // Load value from global memory
        a[idx] = value * value; // Store squared value to global memory
    }
}