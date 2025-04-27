#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Combine index computation for clarity
    int stride = gridDim.x * blockDim.x;            // Compute stride value
    for(int idx = i; idx < N; idx += stride) {      // Loop through all elements with stride
        X[idx * INCX] = ALPHA;                      // Assign ALPHA to each element
    }
}