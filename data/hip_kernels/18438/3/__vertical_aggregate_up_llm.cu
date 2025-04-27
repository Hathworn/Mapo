#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

// dp - cost aggregation array
// cost_image - m x n x D array
// d - use every d channels of input to conserve register memory
// m - image rows
// n - image columns
// D - depth
// depth_stride - pitch along depth dimension
// row_stride - pitch along row dimension

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

__global__ void __vertical_aggregate_up(float *dp, float *cost_image, int m, int n) {
    // Calculate linear thread index in grid
    int globalId = blockDim.x * blockIdx.x + threadIdx.x;
    int depth_dim_size = m * n;

    // Optimize warp utilization by ensuring contiguous threads work on neighboring columns
    if (globalId < n) {
        for (int row = m - 2; row >= 0; row--) {
            float prev_min = 100000000.0;
            int ind = (row + 1) * n + globalId;

            // Optimize depth loop to minimize register usage
            for (int depth = 0; depth < D; depth += D_STEP) {
                prev_min = fminf(dp[ind], prev_min);
                ind += depth_dim_size * D_STEP;
            }

            float d0 = 0;
            float d1 = 0;
            float d2 = 0;
            float d3 = prev_min + (float) P2;
            ind = (row + 1) * n + globalId;
            int current_ind = row * n + globalId;

            // Use loop unrolling to improve performance
            for (int d = 0; d < D; d += D_STEP) {
                dp[current_ind] += cost_image[current_ind] + dp_criteria(dp, ind, depth_dim_size, d, (float) P1, (float) P2, &d0, &d1, &d2, &d3);
                ind += depth_dim_size * D_STEP;
                current_ind += depth_dim_size * D_STEP;
            }
        }
    }
}