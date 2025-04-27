#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeScoreList(int *starting_voxel_id, int *voxel_id, int valid_points_num, double *e_x_cov_x, double gauss_d1, double *score)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    if (id < valid_points_num) {  // Bound check for threads
        double score_inc = 0;

        for (int vid = starting_voxel_id[id]; vid < starting_voxel_id[id + 1]; vid++) {
            double tmp_ex = e_x_cov_x[vid];

            // Simplified condition check using isnan for NaN values
            if (tmp_ex >= 0 && tmp_ex <= 1) {
                score_inc += -gauss_d1 * tmp_ex;
            }
        }

        score[id] = score_inc;
    }
}