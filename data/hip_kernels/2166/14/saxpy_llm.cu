#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void saxpy(int * a, int * b, int * c, int n)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop with stride to process all elements
    for (int i = tid; i < n; i += stride)
    {
        c[i] = 2 * a[i] + b[i];
    }
}