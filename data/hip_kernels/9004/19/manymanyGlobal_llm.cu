#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void manymanyGlobal(int* a, int* b)
{
    // Get global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over the iterations
    for(int j = 0; j < ITER; j++)
    {
        // Use stride loop based on grid size for better parallelism
        for(int i = idx; i < SIZE; i += blockDim.x * gridDim.x)
        {
            a[i] = 0;
            b[i] = 0;
        }
    }
}