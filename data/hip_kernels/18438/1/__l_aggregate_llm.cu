#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

__device__ float dp_criteria(float *dp, int ind, int depth_dim_size, int d, float P_one, float P_two, float * d_zero, float * d_one, float * d_two, float * d_three) {
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

__global__ void __l_aggregate(float *dp, float *cost_image, int m, int n) {
    int row = threadIdx.y + blockIdx.y * blockDim.y;
    int col = n - 1 - threadIdx.x;
    int depth_dim_size = m * n;
    __shared__ float MinArray[SHMEM_SIZE][SHMEM_SIZE];
    int K = n - 1;

    // Invert the order to ensure correct operation and improve readability, if needed.
    while (col >= 0 && row < m) {
        int ind = row * n + col;
        float prev_min = 100000000.0;
        
        // Optimize loop aggregation for GPU memory access patterns
        for (int depth = 0; depth < D; depth += D_STEP) {
            prev_min = fminf(dp[ind], prev_min);
            ind += (depth_dim_size * D_STEP);
        }

        MinArray[threadIdx.y][SHMEM_SIZE - 1 - threadIdx.x] = prev_min;
        __syncthreads();

        float d0 = 0;
        float d1 = 0;
        float d2 = 0;

        // Only execute for threads with threadIdx.y == 0, optimizing warp execution
        if (threadIdx.y == 0) {
            int agg_row = threadIdx.x + blockIdx.y * blockDim.y;
            int start_K = K;
            int local_K = SHMEM_SIZE - 1;

            if (agg_row < m) {
                for (; K > 0 && K > (start_K - SHMEM_SIZE); K--) {
                    float d3 = MinArray[threadIdx.x][local_K] + (float)P2;
                    int ind = agg_row * n + K - 1;
                    for (int d = 0; d < D; d += D_STEP) {
                        dp[ind] += cost_image[ind] + dp_criteria(dp, ind + 1, depth_dim_size, d, (float)P1, (float)P2, &d0, &d1, &d2, &d3);
                        ind += (depth_dim_size * D_STEP);
                    }
                    local_K--;
                }
            }
        }

        __syncthreads();
        col -= blockDim.x;
    }
}