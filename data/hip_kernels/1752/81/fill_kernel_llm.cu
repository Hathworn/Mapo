#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * gridDim.x) * (blockDim.x * gridDim.y);

    // Use a stride loop for coalesced memory access
    for (int i = idx; i < N; i += blockDim.x * gridDim.x * gridDim.y)
    {
        X[i * INCX] = ALPHA;
    }
}