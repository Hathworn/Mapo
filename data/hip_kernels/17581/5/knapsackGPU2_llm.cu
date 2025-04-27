#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function 
__global__ void knapsackGPU2(int* dp, int* d_value, int* d_weight, int capacity, int n)
{
    int in = threadIdx.x + (blockDim.x * blockIdx.x);

    // Loop unrolling, reducing total iterations for row == 0 and row == 1
    if (in <= (capacity + 1)) {
        dp[in] = 0; // Initialize base row to zero
    }

    for (int row = 1; row <= n; row++) 
    {
        int ind = in + (row * (capacity + 1));

        // Conditional check to omit unnecessary executions
        if (in > 0 && in <= (capacity + 1)) 
        {
            if (in >= d_weight[row - 1]) 
            {
                int value_with_item = d_value[row - 1] + dp[ind - (capacity + 1) - d_weight[row - 1]];
                int value_without_item = dp[ind - (capacity + 1)];
                dp[ind] = max(value_with_item, value_without_item); // Simplify to single max function call
            } 
            else 
            {
                dp[ind] = dp[ind - (capacity + 1)];
            }
        }
    }
}