#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeCovDxdPi(int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *inverse_covariance, int voxel_num, double gauss_d1, double gauss_d2, double *point_gradients, double *cov_dxd_pi, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int row = blockIdx.y;
    int col = blockIdx.z;

    // Process only if row and col within bounds
    if (row < 3 && col < 6) {
        // Directly compute starting offsets for faster access
        double *icov0 = inverse_covariance + row * 3 * voxel_num;
        double *cov_dxd_pi_tmp = cov_dxd_pi + (row * 6 + col) * valid_voxel_num;
        double *pg_tmp0 = point_gradients + col * valid_points_num;
        double *pg_tmp1 = pg_tmp0 + 6 * valid_points_num;
        double *pg_tmp2 = pg_tmp1 + 6 * valid_points_num;

        for (int i = id; i < valid_points_num; i += stride) {
            double pg0 = pg_tmp0[i];
            double pg1 = pg_tmp1[i];
            double pg2 = pg_tmp2[i];

            for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
                int vid = voxel_id[j];

                // Preload inverse_covariance values to reduce L1 cache misses
                double ic0 = icov0[vid];
                double ic1 = icov0[vid + voxel_num];
                double ic2 = icov0[vid + 2 * voxel_num];

                cov_dxd_pi_tmp[j] = ic0 * pg0 + ic1 * pg1 + ic2 * pg2;
            }
        }
    }
}