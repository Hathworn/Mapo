#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride to allow every thread to process multiple elements if necessary
    int stride = blockDim.x * gridDim.x;
    for(; i < N; i += stride)
    {
        X[i * INCX] = ALPHA;
    }
}