#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_array_gpu(float *a, int power, int array_size)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < array_size)
    {
        // Use a temporary variable to cache a[idx] to avoid redundant memory reads
        float base = a[idx];
        float result = 1.0f;

        // Use exponentiation by squaring for efficient computation
        int p = power;
        while (p > 0)
        {
            if (p % 2 == 1) // If power is odd
                result *= base;
            base *= base; // Square the base
            p /= 2; // Reduce power by half
        }
        a[idx] = result;
    }
}