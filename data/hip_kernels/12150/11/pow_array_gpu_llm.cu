#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_array_gpu(float *a, int power, int array_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < array_size)
    {
        float base = a[idx]; // Store base value
        float result = 1;
        for (int i = 0; i < power; ++i)
        {
            result *= base; // Use pre-stored value
        }
        a[idx] = result;
    }
}