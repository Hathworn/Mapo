#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float *d_zero, float *d_one, float *d_two, float *d_three) {
    *d_zero = dp[ind];
    *d_one = (d > 0) ? dp[ind - depth_dim_size] + P_one : 10000000;
    *d_two = (d < D - 1) ? dp[ind + depth_dim_size] + P_one : 10000000;
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __diagonal_tl_br_aggregate(float *dp, float *cost_image, int m, int n) {
    int start_col = blockDim.x * blockIdx.x + threadIdx.x + 1;
    int depth_dim_size = m * n;

    while (start_col < n) {
        int col = start_col;
        for (int row = 1; row < m; row++) {
            float prev_min = 100000000.0f;
            int ind = (row - 1) * n + col - 1;

            // Calculate minimum disparity cost for this column from row-1
            for (int depth = 0; depth < D; depth += D_STEP) {
                prev_min = fminf(dp[ind], prev_min);
                ind += (depth_dim_size * D_STEP);
            }

            float d0 = 0, d1 = 0, d2 = 0, d3 = prev_min + (float)P2;
            ind = (row - 1) * n + col - 1;
            int current_ind = row * n + col;

            // Unroll loop to improve performance
            #pragma unroll
            for (int d = 0; d < D; d += D_STEP) {
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, (float)P1, (float)P2, &d0, &d1, &d2, &d3);
                ind += (depth_dim_size * D_STEP);
                current_ind += (depth_dim_size * D_STEP);
            }

            col += 1;
            if (col == n) col = 1; // Wrap each thread around once it gets to the last column
        }
        start_col += blockDim.x;
    }
}