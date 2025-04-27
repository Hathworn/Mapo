#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float * d_zero, float * d_one, float * d_two, float * d_three){
    *d_zero = dp[ind];
    if (d > 0)
        *d_one = dp[ind - depth_dim_size] + P_one;
    else
        *d_one = 10000000;

    if (d < D-1)
        *d_two = dp[ind + depth_dim_size] + P_one;
    else
        *d_two = 10000000;
    
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __diagonal_br_tl_aggregate(float *dp, float *cost_image, int m, int n)
{
    int start_col = (n - 2) - (blockDim.x * blockIdx.x) - threadIdx.x;
    int depth_dim_size = m * n;

    // Optimize loop with early out to reduce unnecessary calculations
    while(start_col >= 0)
    {
        int col = start_col;
        for (int row = m - 2; row >= 0; row--)
        {
            float prev_min = 100000000.0f;
            int ind = (row + 1) * n + col + 1;

            // Unroll the depth loop to increase efficiency
            #pragma unroll
            for (int depth = 0; depth < D; depth += D_STEP){
                prev_min = fminf(dp[ind], prev_min);
                ind += (depth_dim_size * D_STEP);
            }

            float d0, d1, d2, d3 = prev_min + (float) P2;
            ind = (row + 1) * n + col + 1;
            int current_ind = row * n + col;

            // Optimize the d loop using fewer conditions
            #pragma unroll
            for (int d = 0; d < D; d += D_STEP){
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, (float) P1, (float) P2, &d0, &d1, &d2, &d3);
                ind += (depth_dim_size * D_STEP);
                current_ind += (depth_dim_size * D_STEP);
            }

            col -= 1;
            if (col < 0)
                col = n - 2;
        }
        start_col -= blockDim.x;
    }
}