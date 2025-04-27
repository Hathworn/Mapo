#include "hip/hip_runtime.h"
#include "includes.h"

/* Constants */

#define threads 256

/* Kernels */

__global__ void binning_mix(float *xd_real, float *yd_real, float *zd_real, float *xd_sim, float *yd_sim, float *zd_sim, float *ZY, int lines_number_1, int lines_number_2, int points_per_degree, int number_of_degrees)
{
    __shared__ float temp[threads];
    int index = threadIdx.x;
    temp[index] = 0;
    
    float x, y, z;
    float xx, yy, zz;
    float angle;
    
    int dim_idx;
    int stride = blockDim.x * gridDim.x; // Avoid recomputing stride each time

    for (int i = 0; i < lines_number_1; i++)
    {
        x = xd_real[i];
        y = yd_real[i];
        z = zd_real[i];

        for (dim_idx = blockIdx.x * blockDim.x + threadIdx.x; dim_idx < lines_number_2; dim_idx += stride)
        {
            xx = xd_sim[dim_idx];
            yy = yd_sim[dim_idx];
            zz = zd_sim[dim_idx];

            angle = fminf(x * xx + y * yy + z * zz, 1.0); // Consolidate fminf and dot product
            angle = acosf(angle) * 180.0 / M_PI;

            if (angle < number_of_degrees)
            {
                atomicAdd(&temp[int(angle * points_per_degree)], 1.0);
            }
        }
    }

    atomicAdd(&ZY[index], temp[index]); // Avoid unnecessary synchronization
}