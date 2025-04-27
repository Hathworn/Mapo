#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computePointHessian2(float *x, float *y, float *z, int points_num, int *valid_points, int valid_points_num, double *dh_ang, double *ph155, double *ph165, double *ph175) {
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    __shared__ double h_ang[9];

    // Load shared memory efficiently
    if (threadIdx.x < 9) {
        h_ang[threadIdx.x] = dh_ang[36 + threadIdx.x];
    }

    __syncthreads();

    for (int i = id; i < valid_points_num; i += stride) {
        int pid = valid_points[i];

        // Load original coordinates
        double o_x = static_cast<double>(x[pid]);
        double o_y = static_cast<double>(y[pid]);
        double o_z = static_cast<double>(z[pid]);

        // Compute the Hessians more efficiently
        double x_h_ang1 = o_x * h_ang[1];
        double y_h_ang0 = o_y * h_ang[0];
        double z_h_ang2 = o_z * h_ang[2];
        ph155[i] = y_h_ang0 + x_h_ang1 + z_h_ang2;

        double x_h_ang4 = o_x * h_ang[4];
        double y_h_ang3 = o_y * h_ang[3];
        double z_h_ang5 = o_z * h_ang[5];
        ph165[i] = y_h_ang3 + x_h_ang4 + z_h_ang5;

        double x_h_ang7 = o_x * h_ang[7];
        double y_h_ang6 = o_y * h_ang[6];
        double z_h_ang8 = o_z * h_ang[8];
        ph175[i] = y_h_ang6 + x_h_ang7 + z_h_ang8;
    }
}