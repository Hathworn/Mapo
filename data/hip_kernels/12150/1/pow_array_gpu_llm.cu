#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_array_gpu(float *a, int power, int array_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Only calculate if index is within array size range
    if (idx < array_size)
    {
        float base = a[idx];
        float result = 1.0f;

        // Use a more efficient method for power calculation
        for (int i = 0; i < power; ++i)
        {
            result *= base;
        }

        // Store the result back into the array
        a[idx] = result;
    }
}