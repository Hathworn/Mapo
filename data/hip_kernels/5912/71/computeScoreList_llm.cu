#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeScoreList(int *starting_voxel_id, int *voxel_id, int valid_points_num, double *e_x_cov_x, double gauss_d1, double *score)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Ensure thread does not exceed number of valid points
    if (id < valid_points_num) {
        double score_inc = 0;

        // Optimize loop to reduce shared memory divergence
        int start_vid = starting_voxel_id[id];
        int end_vid = starting_voxel_id[id + 1];

        for (int vid = start_vid; vid < end_vid; vid++) {
            double tmp_ex = e_x_cov_x[vid];

            // Use branch-free method for nan check
            if (!(tmp_ex > 1 || tmp_ex < 0 || tmp_ex != tmp_ex)) {
                score_inc -= gauss_d1 * tmp_ex;
            }
        }

        score[id] = score_inc;
    }
}