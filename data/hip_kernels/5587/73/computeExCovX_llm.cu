#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeExCovX(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centr_x, double *centr_y, double *centr_z, double gauss_d1, double gauss_d2, double *e_x_cov_x, double *icov00, double *icov01, double *icov02, double *icov10, double *icov11, double *icov12, double *icov20, double *icov21, double *icov22)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling to reduce loop overhead
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

            // Load data into registers to reduce memory access time
            double icov00_vid = icov00[vid];
            double icov01_vid = icov01[vid];
            double icov02_vid = icov02[vid];
            double icov10_vid = icov10[vid];
            double icov11_vid = icov11[vid];
            double icov12_vid = icov12[vid];
            double icov20_vid = icov20[vid];
            double icov21_vid = icov21[vid];
            double icov22_vid = icov22[vid];

            // Minimize repeated calculations and use fused multiply-add
            double exp_arg = gauss_d2 * ((t_x * icov00_vid + t_y * icov01_vid + t_z * icov02_vid) * t_x
                         + (t_x * icov10_vid + t_y * icov11_vid + t_z * icov12_vid) * t_y
                         + (t_x * icov20_vid + t_y * icov21_vid + t_z * icov22_vid) * t_z) / 2.0;

            e_x_cov_x[j] = exp(-exp_arg);
        }
    }
}