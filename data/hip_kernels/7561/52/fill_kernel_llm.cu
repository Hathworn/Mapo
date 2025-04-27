#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fill_kernel(int N, float ALPHA, float *X, int INCX)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index

    // Use grid-stride loop for better utilization
    for (; i < N; i += blockDim.x * gridDim.x)
    {
        X[i * INCX] = ALPHA;  // Set the value at the correct index
    }
}