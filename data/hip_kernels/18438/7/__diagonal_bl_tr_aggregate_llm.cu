#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float *d_zero, float *d_one, float *d_two, float *d_three){
    // Unrolling the if-else to ensure consistent operation within specific range
    *d_zero = dp[ind];
    *d_one = (d > 0) ? dp[ind - depth_dim_size] + P_one : 10000000;
    *d_two = (d < D-1) ? dp[ind + depth_dim_size] + P_one : 10000000;
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __diagonal_bl_tr_aggregate(float *dp, float *cost_image, int m, int n)
{
    int start_col = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int depth_dim_size = m * n;

    // Load previous minimum value into a register at the start of the row
    while (start_col < n)
    {
        int col = start_col;
        for (int row = m - 2; row >= 0; row--)
        {
            float prev_min = 100000000.0;
            int ind = (row + 1) * n + col - 1;

            // Pre-compute starting index and reuse it efficiently
            for (int depth = 0; depth < D; depth += D_STEP) {
                prev_min = fminf(dp[ind], prev_min);
                ind += depth_dim_size * D_STEP;
            }

            float d0 = 0, d1 = 0, d2 = 0, d3 = prev_min + (float) P2;
            ind = (row + 1) * n + col - 1;
            int current_ind = row * n + col;

            // Unrolling and restructuring loop for better performance
            for (int d = 0; d < D; d += D_STEP) {
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, (float) P1, (float) P2, &d0, &d1, &d2, &d3);
                ind += depth_dim_size * D_STEP;
                current_ind += depth_dim_size * D_STEP;
            }

            col += 1;
            if (col == n)
                col = 1;
        }
        start_col += blockDim.x;
    }
}