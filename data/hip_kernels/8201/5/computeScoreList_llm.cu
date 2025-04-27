#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeScoreList(int *starting_voxel_id, int *voxel_id, int valid_points_num, double *e_x_cov_x, double gauss_d1, double *score)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for frequent access
    __shared__ double local_score[1024];

    for (int i = id; i < valid_points_num; i += stride) {
        double score_inc = 0;
        for (int vid = starting_voxel_id[i]; vid < starting_voxel_id[i + 1]; vid++) {
            double tmp_ex = e_x_cov_x[vid];
            // Check for valid values and accumulate score increment
            score_inc += (fabs(tmp_ex) <= 1.0 && tmp_ex == tmp_ex) ? -gauss_d1 * tmp_ex : 0;
        }
        local_score[threadIdx.x] = score_inc;

        // Copy local results to global memory
        __syncthreads();
        score[i] = local_score[threadIdx.x];
    }
}