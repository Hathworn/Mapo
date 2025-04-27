#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void supp_kernel(int N, float ALPHA, float *X, int INCX)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize memory access pattern
    int stride = gridDim.x * blockDim.x;

    // Process elements in a strided loop
    for (int index = i; index < N; index += stride)
    {
        float value = X[index * INCX];
        if (value * value < ALPHA * ALPHA)
        {
            X[index * INCX] = 0;
        }
    }
}