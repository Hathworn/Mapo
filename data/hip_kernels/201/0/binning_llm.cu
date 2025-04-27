#include "hip/hip_runtime.h"
#include "includes.h"

/* Constants */
#define threads 256 /* It's the number of threads we are going to use per block on the GPU */

/* Kernels */
__global__ void binning(float *xd, float *yd, float *zd, float *ZZ, int number_lines, int points_per_degree, int number_of_degrees)
{
    /* Shared memory for temporary accumulation */
    __shared__ float temp[threads];
    int index = threadIdx.x;
    temp[index] = 0.0f;

    /* Start counting pairs */
    for (int i = blockIdx.x; i < number_lines; i += gridDim.x)
    {
        float x = xd[i];
        float y = yd[i];
        float z = zd[i];

        /* Calculate dot products */
        for (int dim_idx = threadIdx.x; dim_idx < number_lines; dim_idx += blockDim.x)
        {
            float xx = xd[dim_idx];
            float yy = yd[dim_idx];
            float zz = zd[dim_idx];

            /* Compute the angle */
            float angle = fminf(x * xx + y * yy + z * zz, 1.0f);
            angle = acosf(angle) * 180.0f / M_PI;

            /* Count pairs */
            if (angle < number_of_degrees)
            {
                atomicAdd(&temp[int(angle * points_per_degree)], 1.0f);
            }
        }
    }

    __syncthreads();

    /* Accumulate results from shared to global memory */
    if (index < number_of_degrees * points_per_degree)
    {
        atomicAdd(&ZZ[index], temp[index]);
    }
}