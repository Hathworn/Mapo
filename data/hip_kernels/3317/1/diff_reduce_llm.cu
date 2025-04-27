```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void diff_reduce(double *dev_w, double *feat, double *pos, int feat_dim, int pos_dim, int par0, int par1, int n_patch)
{
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    if (i == j || i >= n_patch || j >= n_patch)
        return;

    double feat_dist = 0.0;
    double pos_dist = 0.0;
    int feat_offi = i * feat_dim;
    int feat_offj = j * feat_dim;
    int pos_offi = i * pos_dim;
    int pos_offj = j * pos_dim;

    // Unroll loop for better performance
    #pragma unroll
    for (int k = 0; k < feat_dim; k++) {
        double feat_i = feat[feat_offi + k];
        double feat_j = feat[feat_offj + k];
        feat_dist += (feat_i - feat_j) * (feat_i - feat_j);
    }

    // Unroll loop for better performance
    #pragma unroll
    for (int k = 0; k < pos_dim; k++) {
        double pos_i = pos[pos_offi + k];
        double pos_j = pos[pos_offj + k];
        pos_dist += (pos_i - pos_j) * (pos_i - pos_j);
    }

    // Utilize a single exp call using multiplication
    dev_w[i + j * n_patch] = exp(-(feat_dist / (feat_dim * par0 * par0) + pos_dist / (pos_dim * par1 * par1)));
}