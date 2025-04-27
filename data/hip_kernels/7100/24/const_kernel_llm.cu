#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Use shared memory to potentially reduce global memory accesses
    int idx = blockIdx.x * blockDim.x + threadIdx.x;       // Calculate the global thread index
    int stride = gridDim.x * blockDim.x;                   // Calculate the grid stride

    // Loop over the input data with grid stride
    for (int i = idx; i < N; i += stride)
    {
        X[i * INCX] = ALPHA;
    }
}