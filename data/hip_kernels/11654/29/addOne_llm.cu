#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void addOne(float *vals, int N, float *out)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of global index

    if (idx < N) {
        out[idx] = vals[idx] + 1.0f; // Use float suffix for precision
    }
}