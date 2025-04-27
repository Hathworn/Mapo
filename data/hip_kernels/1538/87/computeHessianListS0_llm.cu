#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeHessianListS0(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centroid_x, double *centroid_y, double *centroid_z, double *icov00, double *icov01, double *icov02, double *icov10, double *icov11, double *icov12, double *icov20, double *icov21, double *icov22, double *point_gradients, double *tmp_hessian, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int col = blockIdx.y;

    if (col < 6) {
        double *tmp_pg0 = point_gradients + col * valid_points_num;
        double *tmp_pg1 = tmp_pg0 + 6 * valid_points_num;
        double *tmp_pg2 = tmp_pg1 + 6 * valid_points_num;
        double *tmp_h = tmp_hessian + col * valid_voxel_num;

        for (int i = id; i < valid_points_num; i += stride) {
            // Precompute invariant elements for efficiency
            int pid = valid_points[i];
            double d_x = static_cast<double>(trans_x[pid]);
            double d_y = static_cast<double>(trans_y[pid]);
            double d_z = static_cast<double>(trans_z[pid]);

            double pg0 = tmp_pg0[i];
            double pg1 = tmp_pg1[i];
            double pg2 = tmp_pg2[i];

            for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
                int vid = voxel_id[j];

                // Cache the icov matrix for the current voxel
                double ic00 = icov00[vid], ic01 = icov01[vid], ic02 = icov02[vid];
                double ic10 = icov10[vid], ic11 = icov11[vid], ic12 = icov12[vid];
                double ic20 = icov20[vid], ic21 = icov21[vid], ic22 = icov22[vid];

                // Compute components of the equation to reduce redundant operations
                double t_x = (d_x - centroid_x[vid]);
                double t_y = (d_y - centroid_y[vid]);
                double t_z = (d_z - centroid_z[vid]);

                // Accumulate result into the hessian matrix
                tmp_h[j] = (t_x * (ic00 * pg0 + ic01 * pg1 + ic02 * pg2))
                        + (t_y * (ic10 * pg0 + ic11 * pg1 + ic12 * pg2))
                        + (t_z * (ic20 * pg0 + ic21 * pg1 + ic22 * pg2));
            }
        }
    }
}