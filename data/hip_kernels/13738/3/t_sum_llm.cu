```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void t_sum(float *a, float *out, int n_elements)
{
    // Calculate the global thread index
    const int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize out[0] only once before any atomic operations
    if (i == 0) out[0] = 0;
    __syncthreads();

    // Perform atomic addition only if the index is within bounds
    if (i < n_elements)
    {
        atomicAdd(out, a[i]);
    }
}