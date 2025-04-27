#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeCovDxdPi(int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *inverse_covariance, int voxel_num, double gauss_d1, double gauss_d2, double *point_gradients, double *cov_dxd_pi, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int row = blockIdx.y;
    int col = blockIdx.z;

    // Ensure threads are working within the meaningful indices for row and col
    if (row < 3 && col < 6) {
        // Reorganized pointers for better memory coalescing
        double *icov_row_base = inverse_covariance + row * 3 * voxel_num;
        double *cov_dxd_pi_tmp = cov_dxd_pi + (row * 6 + col) * valid_voxel_num;
        double *pg_base = point_gradients + col * valid_points_num;

        for (int i = id; i < valid_points_num; i += stride) {
            double pg0 = pg_base[i];
            double pg1 = pg_base[i + 6 * valid_points_num];
            double pg2 = pg_base[i + 12 * valid_points_num];

            // Combine the two loops for contiguous memory access
            int start_vid = starting_voxel_id[i];
            int end_vid = starting_voxel_id[i + 1];
            for (int j = start_vid; j < end_vid; j++) {
                int vid = voxel_id[j];
                cov_dxd_pi_tmp[j] = icov_row_base[vid] * pg0 + 
                                    icov_row_base[voxel_num + vid] * pg1 + 
                                    icov_row_base[2 * voxel_num + vid] * pg2;
            }
        }
    }
}