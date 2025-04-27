#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeExCovX(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centr_x, double *centr_y, double *centr_z, double gauss_d1, double gauss_d2, double *e_x_cov_x, double *icov00, double *icov01, double *icov02, double *icov10, double *icov11, double *icov12, double *icov20, double *icov21, double *icov22)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling and pre-computation optimization
    for (int i = id; i < valid_points_num; i += stride) {
        int pid = valid_points[i];
        double d_x = static_cast<double>(trans_x[pid]);
        double d_y = static_cast<double>(trans_y[pid]);
        double d_z = static_cast<double>(trans_z[pid]);

        for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
            int vid = voxel_id[j];

            double t_x = d_x - centr_x[vid];
            double t_y = d_y - centr_y[vid];
            double t_z = d_z - centr_z[vid];

            // Pre-compute repeated calculations for efficiency
            double icov0 = t_x * icov00[vid] + t_y * icov01[vid] + t_z * icov02[vid];
            double icov1 = t_x * icov10[vid] + t_y * icov11[vid] + t_z * icov12[vid];
            double icov2 = t_x * icov20[vid] + t_y * icov21[vid] + t_z * icov22[vid];

            e_x_cov_x[j] = exp(-gauss_d2 * (icov0 * t_x + icov1 * t_y + icov2 * t_z) / 2.0);
        }
    }
}