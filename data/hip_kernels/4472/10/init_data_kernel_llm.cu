#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_data_kernel(int n, double* x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Using a stride loop improves memory access patterns
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        x[i] = n - i;
    }
}