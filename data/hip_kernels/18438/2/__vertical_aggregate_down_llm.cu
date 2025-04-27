#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float *d_zero, float *d_one, float *d_two, float *d_three) {
    *d_zero = dp[ind];
    *d_one = (d > 0) ? dp[ind - depth_dim_size] + P_one : 10000000;
    *d_two = (d < D-1) ? dp[ind + depth_dim_size] + P_one : 10000000;
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __vertical_aggregate_down(float *dp, float *cost_image, int m, int n) {
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int depth_dim_size = m * n;

    while(col < n) {
        for (int row = 1; row < m; row++) {
            float prev_min = 100000000.0;
            int ind = (row - 1) * n + col;

            // Unroll loop explicitly to improve performance
            #pragma unroll
            for (int depth = 0; depth < D; depth += D_STEP) {
                prev_min = fminf(dp[ind], prev_min);
                ind += (depth_dim_size * D_STEP);
            }

            float d0 = 0, d1 = 0, d2 = 0;
            float d3 = prev_min + (float) P2;
            ind = (row - 1) * n + col;
            int current_ind = row * n + col;

            // Unroll loop explicitly to improve performance
            #pragma unroll
            for (int d = 0; d < D; d += D_STEP) {
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, (float) P1, (float) P2, &d0, &d1, &d2, &d3);
                ind += (depth_dim_size * D_STEP);
                current_ind += (depth_dim_size * D_STEP);
            }
        }
        col += gridDim.x * blockDim.x; // Advance column calculation by entire grid
    }
}