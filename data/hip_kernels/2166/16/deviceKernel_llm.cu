#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deviceKernel(int *a, int N)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use conditional check to avoid out-of-bounds access
    if (idx < N) {
        a[idx] = 1;
    }
}