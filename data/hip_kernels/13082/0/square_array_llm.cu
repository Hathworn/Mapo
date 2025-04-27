#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to square elements of array 'a'
__global__ void square_array(float *a, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and unroll loop if feasible
    if (idx < N) {
        float val = a[idx];
        a[idx] = val * val;
    }
}