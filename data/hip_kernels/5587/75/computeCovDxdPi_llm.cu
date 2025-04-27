#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeCovDxdPi(int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *inverse_covariance, int voxel_num, double gauss_d1, double gauss_d2, double *point_gradients, double *cov_dxd_pi, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int row = blockIdx.y;
    int col = blockIdx.z;

    // Process only necessary rows and columns
    if (row < 3 && col < 6) {
        double *icov0 = inverse_covariance + row * 3 * voxel_num;
        double *icov1 = icov0 + voxel_num;
        double *icov2 = icov1 + voxel_num;
        double *cov_dxd_pi_tmp = cov_dxd_pi + (row * 6 + col) * valid_voxel_num;
        double *pg_tmp0 = point_gradients + col * valid_points_num;
        double *pg_tmp1 = pg_tmp0 + 6 * valid_points_num;
        double *pg_tmp2 = pg_tmp1 + 6 * valid_points_num;

        // Unroll loop for better performance
        for (int i = id; i < valid_points_num; i += stride) {
            double pg0 = pg_tmp0[i];
            double pg1 = pg_tmp1[i];
            double pg2 = pg_tmp2[i];

            // Efficient memory access by storing index once
            int start_voxel = starting_voxel_id[i];
            const int end_voxel = starting_voxel_id[i + 1];

            // Use one-load-per-access pattern for voxel ids
            for (int j = start_voxel; j < end_voxel; j++) {
                int vid = voxel_id[j];

                cov_dxd_pi_tmp[j] = icov0[vid] * pg0 + icov1[vid] * pg1 + icov2[vid] * pg2;
            }
        }
    }
}