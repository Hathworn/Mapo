#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeScoreList(int *starting_voxel_id, int *voxel_id, int valid_points_num, double *e_x_cov_x, double gauss_d1, double *score)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Cache common data in registers
    while (id < valid_points_num) {
        double score_inc = 0;

        int start = starting_voxel_id[id];
        int end = starting_voxel_id[id + 1];

        // Unroll loop for efficiency
        for (int vid = start; vid < end; vid++) {
            double tmp_ex = e_x_cov_x[vid];

            // Avoid NaN and out-of-range values
            score_inc += (tmp_ex > 1.0 || tmp_ex < 0.0 || isnan(tmp_ex)) ? 0.0 : -gauss_d1 * tmp_ex;
        }

        score[id] = score_inc;

        id += stride; // Move to the next batch of work based on stride
    }
}