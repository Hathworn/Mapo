#include "hip/hip_runtime.h"
#include "includes.h"
//#define DEPTH 2

// Optimized kernel for 3D matrix argmin computation
__global__ void argmin_3d_mat(float *dp, int *stereo_im, int m, int n)
{
    int col = blockDim.x * blockIdx.x + threadIdx.x;
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int imsize = m * n;
    int loop_limit = D * imsize;

    if (col < n && row < m) { // Use boundary checks inside loop
        int min_ind = -1;
        float current_min = 100000000.0f;
        int current_val = row * n + col;
        int v = 0;

        for (int depth = 0; depth < loop_limit; depth += imsize) {
            float val = dp[depth + current_val]; // Cache the value
            if (val < current_min) {
                min_ind = v;
                current_min = val;
            }
            v++;
        }
        stereo_im[current_val] = min_ind;
    }
}