#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void deviceKernel(int *a, int N)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to cache data between threads if necessary
    for (int i = idx; i < N; i += stride)
    {
        // Check boundary conditions to prevent out-of-bounds access
        if (i < N)
        {
            a[i] = 1;
        }
    }
}