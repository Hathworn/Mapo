```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void const_kernel(int N, float ALPHA, float *X, int INCX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Simplify and optimize index calculation
    int stride = blockDim.x * gridDim.x; // Define stride for grid-stride loop

    for (int i = idx; i < N; i += stride) // Use grid-stride loop for better performance
    {
        X[i * INCX] = ALPHA; // Update with ALPHA
    }
}