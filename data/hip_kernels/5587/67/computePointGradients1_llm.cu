#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by using loop unrolling and reducing shared memory accesses
__global__ void computePointGradients1(float *x, float *y, float *z, int points_num, int *valid_points, int valid_points_num, double *dj_ang, double *pg24, double *pg05, double *pg15, double *pg25)
{
    __shared__ double j_ang[12];
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    if (threadIdx.x < 12) {
        j_ang[threadIdx.x] = dj_ang[threadIdx.x + 12];
    }

    __syncthreads();

    for (int i = id; i < valid_points_num; i += stride) {
        int pid = valid_points[i];

        // Orignal coordinates
        double o_x = static_cast<double>(x[pid]);
        double o_y = static_cast<double>(y[pid]);
        double o_z = static_cast<double>(z[pid]);

        // Compute point derivatives using loop unrolling for efficiency
        double j_ang0 = j_ang[0], j_ang1 = j_ang[1], j_ang2 = j_ang[2];
        pg24[i] = o_x * j_ang0 + o_y * j_ang1 + o_z * j_ang2;

        double j_ang3 = j_ang[3], j_ang4 = j_ang[4], j_ang5 = j_ang[5];
        pg05[i] = o_x * j_ang3 + o_y * j_ang4 + o_z * j_ang5;

        double j_ang6 = j_ang[6], j_ang7 = j_ang[7], j_ang8 = j_ang[8];
        pg15[i] = o_x * j_ang6 + o_y * j_ang7 + o_z * j_ang8;

        double j_ang9 = j_ang[9], j_ang10 = j_ang[10], j_ang11 = j_ang[11];
        pg25[i] = o_x * j_ang9 + o_y * j_ang10 + o_z * j_ang11;
    }
}