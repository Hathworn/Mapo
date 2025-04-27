#include "hip/hip_runtime.h"
#include "includes.h"

/* Constants */

#define threads 256 /* It's the number of threads we are going to use per block on the GPU */

/* Kernels */

__global__ void binning_mix(float *xd_real, float *yd_real, float *zd_real, float *xd_sim, float *yd_sim, float *zd_sim, float *ZY, int lines_number_1, int lines_number_2, int points_per_degree, int number_of_degrees)
{
    /* Shared memory for storing temporary results */
    __shared__ float temp[threads];

    /* Each thread initializes its shared memory slot to zero */
    temp[threadIdx.x] = 0;
    __syncthreads(); /* Ensure all threads have initialized their shared memory */

    /* Iterate over the first set of data */
    for (int i = 0; i < lines_number_1; i++)
    {
        float x = xd_real[i];
        float y = yd_real[i];
        float z = zd_real[i];

        /* Compute using block-level parallelism */
        for (int dim_idx = blockIdx.x * blockDim.x + threadIdx.x;
             dim_idx < lines_number_2;
             dim_idx += blockDim.x * gridDim.x)
        {
            float xx = xd_sim[dim_idx];
            float yy = yd_sim[dim_idx];
            float zz = zd_sim[dim_idx];

            /* Calculate the dot product and convert to angle */
            float angle = x * xx + y * yy + z * zz;
            angle = fminf(angle, 1.0);
            angle = acosf(angle) * 180.0 / M_PI;

            /* Count pairs if angle < number_of_degrees */
            if (angle < number_of_degrees)
            {
                atomicAdd(&temp[int(angle * points_per_degree)], 1.0f);
            }
        }
    }

    /* Copy results from shared to global memory */
    atomicAdd(&ZY[threadIdx.x], temp[threadIdx.x]);
}