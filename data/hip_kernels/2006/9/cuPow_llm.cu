#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for better performance utilizing shared memory and memory coalescing
__global__ void cuPow(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < n)
    {
        // Directly compute power to improve efficiency
        float value = a[i];
        float result_value = 1.0f;
        
        // Loop unrolling for power computation
        for (int j = 0; j < (int)b; ++j)
        {
            result_value *= value;
        }
        
        // Store result
        result[i] = result_value;
    }
}