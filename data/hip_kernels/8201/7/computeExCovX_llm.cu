#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeExCovX(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centr_x, double *centr_y, double *centr_z, double gauss_d1, double gauss_d2, double *e_x_cov_x, double *icov00, double *icov01, double *icov02, double *icov10, double *icov11, double *icov12, double *icov20, double *icov21, double *icov22)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Optimize loop by using shared memory
    __shared__ double s_centr_x[1024];
    __shared__ double s_centr_y[1024];
    __shared__ double s_centr_z[1024];
    __shared__ double s_icov00[1024];
    __shared__ double s_icov01[1024];
    __shared__ double s_icov02[1024];
    __shared__ double s_icov10[1024];
    __shared__ double s_icov11[1024];
    __shared__ double s_icov12[1024];
    __shared__ double s_icov20[1024];
    __shared__ double s_icov21[1024];
    __shared__ double s_icov22[1024];
    
    for (int i = id; i < valid_points_num; i += stride) {
        int pid = valid_points[i];
        double d_x = static_cast<double>(trans_x[pid]);
        double d_y = static_cast<double>(trans_y[pid]);
        double d_z = static_cast<double>(trans_z[pid]);

        for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
            int vid = voxel_id[j];

            // Load data into shared memory
            if (threadIdx.x == 0) {
                s_centr_x[vid] = centr_x[vid];
                s_centr_y[vid] = centr_y[vid];
                s_centr_z[vid] = centr_z[vid];
                s_icov00[vid] = icov00[vid];
                s_icov01[vid] = icov01[vid];
                s_icov02[vid] = icov02[vid];
                s_icov10[vid] = icov10[vid];
                s_icov11[vid] = icov11[vid];
                s_icov12[vid] = icov12[vid];
                s_icov20[vid] = icov20[vid];
                s_icov21[vid] = icov21[vid];
                s_icov22[vid] = icov22[vid];
            }
            __syncthreads();

            double t_x = d_x - s_centr_x[vid];
            double t_y = d_y - s_centr_y[vid];
            double t_z = d_z - s_centr_z[vid];

            e_x_cov_x[j] = exp(-gauss_d2 * ((t_x * s_icov00[vid] + t_y * s_icov01[vid] + t_z * s_icov02[vid]) * t_x
                                           + ((t_x * s_icov10[vid] + t_y * s_icov11[vid] + t_z * s_icov12[vid]) * t_y)
                                           + ((t_x * s_icov20[vid] + t_y * s_icov21[vid] + t_z * s_icov22[vid]) * t_z)) / 2.0);
            __syncthreads();
        }
    }
}