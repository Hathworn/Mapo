#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for grid stride loop

    for (int i = index; i < n; i += stride)  // Use grid stride loop for better performance
    {
        c[i] = a[i] + b[i];
    }
}