#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void knapsackGPU(int* dp, int row, int* d_value, int* d_weight, int capacity)
{
    // Calculate global index
    int in = threadIdx.x + (blockDim.x * blockIdx.x);
    
    // Calculate index for dp array
    int ind = in + (row * (capacity + 1));

    // Initialize dp array when row is 0
    if (row == 0) {
        if (in <= capacity) {
            dp[in] = 0;
        }
        return;
    }

    // Perform check within bounds of capacity
    if (in > 0 && in <= capacity) {
        if (in >= d_weight[row - 1]) {
            // Update dp[ind] based on comparison
            dp[ind] = max(dp[ind - (capacity + 1)], 
                          d_value[row - 1] + dp[ind - (capacity + 1) - d_weight[row - 1]]);
        } else {
            dp[ind] = dp[ind - (capacity + 1)];
        }
    } else if (in == 0) {
        dp[ind] = 0;
    }
}