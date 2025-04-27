```c
#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float *d_zero, float *d_one, float *d_two, float *d_three) {
    // Optimize: Inline conditional checks with ternary operators
    *d_zero = dp[ind];
    *d_one = (d > 0) ? dp[ind - depth_dim_size] + P_one : 10000000;
    *d_two = (d < D-1) ? dp[ind + depth_dim_size] + P_one : 10000000;
    
    return fminf(fminf(*d_zero, *d_one), fminf(*d_two, *d_three)) - *d_three + P_two;
}

__global__ void __r_aggregate(float *dp, float *cost_image, int m, int n) {
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = threadIdx.x;
    int depth_dim_size = m * n;

    __shared__ float MinArray[SHMEM_SIZE][SHMEM_SIZE];
    int K = 0;

    while ((col < n) & (row < m)) {
        int ind = row * n + col;
        float prev_min = 100000000.0;

        // Optimize: Unroll loop to improve performance
        #pragma unroll
        for (int depth = 0; depth < D; depth += D_STEP) {
            prev_min = fminf(dp[ind], prev_min);
            ind += (depth_dim_size * D_STEP);
        }

        MinArray[threadIdx.y][threadIdx.x] = prev_min;
        __syncthreads();

        float d0 = 0, d1 = 0, d2 = 0;

        if (threadIdx.y == 0) {
            int agg_row = threadIdx.x + blockIdx.y * blockDim.y;
            int start_K = K;
            int local_K = 0;

            if (agg_row < m) {
                // Optimize: Use a bounded loop to prevent over-indexing
                for (; (K < (n - 1)) && (K < (start_K + SHMEM_SIZE)); K++) {
                    float d3 = MinArray[threadIdx.x][local_K] + (float) P2;
                    int ind = agg_row * n + K + 1;

                    // Optimize: Use #pragma unroll to potentially unroll inner loop
                    #pragma unroll
                    for (int d = 0; d < D; d += D_STEP) {
                        dp[ind] += cost_image[ind] + dp_criteria(dp, ind - 1, depth_dim_size, d, (float) P1, (float) P2, &d0, &d1, &d2, &d3);
                        ind += (depth_dim_size * D_STEP);
                    }
                    local_K++;
                }
            }
        }

        __syncthreads();
        col += blockDim.x;
    }
}