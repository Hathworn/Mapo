#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeCovDxdPi(int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *inverse_covariance, int voxel_num, double gauss_d1, double gauss_d2, double *point_gradients, double *cov_dxd_pi, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int row = blockIdx.y;
    int col = blockIdx.z;

    if (row < 3 && col < 6) {
        double *icov_start = inverse_covariance + row * 3 * voxel_num;
        double *cov_dxd_pi_start = cov_dxd_pi + (row * 6 + col) * valid_voxel_num;
        double *pg_start = point_gradients + col * valid_points_num;

        // Move to register for faster access
        double icov0[voxel_num], icov1[voxel_num], icov2[voxel_num];
        for (int k = 0; k < voxel_num; ++k) {
            icov0[k] = icov_start[k];
            icov1[k] = icov_start[k + voxel_num];
            icov2[k] = icov_start[k + 2 * voxel_num];
        }

        for (int i = id; i < valid_points_num; i += stride) {
            double pg0 = pg_start[i];
            double pg1 = pg_start[i + 6 * valid_points_num];
            double pg2 = pg_start[i + 12 * valid_points_num];

            for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
                int vid = voxel_id[j];
                cov_dxd_pi_start[j] = icov0[vid] * pg0 + icov1[vid] * pg1 + icov2[vid] * pg2;
            }
        }
    }
}