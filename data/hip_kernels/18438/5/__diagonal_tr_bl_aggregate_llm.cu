#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float *d_zero, float *d_one, float *d_two, float *d_three) {
    *d_zero = dp[ind];
    if (d > 0)
        *d_one = dp[ind - depth_dim_size] + P_one;
    else
        *d_one = 10000000;

    if (d < DEPTH-1)
        *d_two = dp[ind + depth_dim_size] + P_one;
    else
        *d_two = 10000000;
    
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __diagonal_tr_bl_aggregate(float *dp, float *cost_image, int m, int n) {
    int depth_dim_size = m * n;
    int start_col = n - 2 - blockDim.x * blockIdx.x - threadIdx.x;

    while (start_col >= 0) {
        int col = start_col;
        for (int row = 1; row < m; ++row) {
            float prev_min = 100000000.0;
            int ind = (row - 1) * n + col + 1;

            // Min cost disparity computation for previous row
            for (int depth = 0; depth < DEPTH; depth += D_STEP) {
                prev_min = fminf(dp[ind], prev_min);
                ind += depth_dim_size * D_STEP;
            }

            float d0, d1, d2, d3 = prev_min + P2;
            ind = (row - 1) * n + col + 1;
            int current_ind = row * n + col;

            // Cost aggregation loop for disparities
            for (int d = 0; d < DEPTH; d += D_STEP) {
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, P1, P2, &d0, &d1, &d2, &d3);
                ind += depth_dim_size * D_STEP;
                current_ind += depth_dim_size * D_STEP;
            }

            col -= 1;
            if (col < 0)
                col = n - 2; // Wrap around column
        }
        start_col -= blockDim.x;
    }
}