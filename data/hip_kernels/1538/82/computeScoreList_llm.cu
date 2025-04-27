#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeScoreList(int *starting_voxel_id, int *voxel_id, int valid_points_num, double *e_x_cov_x, double gauss_d1, double *score)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for score accumulation
    extern __shared__ double shared_score[];

    for (int i = id; i < valid_points_num; i += stride) {
        shared_score[threadIdx.x] = 0;

        // Reduce branch divergence by rearranging conditions
        for (int vid = starting_voxel_id[i]; vid < starting_voxel_id[i + 1]; vid++) {
            double tmp_ex = e_x_cov_x[vid];
            if (tmp_ex <= 1 && tmp_ex >= 0 && tmp_ex == tmp_ex) {
                shared_score[threadIdx.x] += -gauss_d1 * tmp_ex;
            }
        }

        // Write result to global memory
        score[i] = shared_score[threadIdx.x];
    }
}