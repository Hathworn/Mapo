#include "hip/hip_runtime.h"
#include "includes.h"

/* Constants */
#define threads 256 /* It's the number of threads we are going to use per block on the GPU */

__global__ void binning(float *xd, float *yd, float *zd, float *ZZ, int number_lines, int points_per_degree, int number_of_degrees)
{
    // Use shared memory for temporary results
    __shared__ float temp[threads];
    
    int index = threadIdx.x;
    temp[index] = 0.0f;

    // Calculate global index once
    int dim_idx = blockIdx.x * blockDim.x + index;

    // Loop over the data lines
    for (int i=0; i<number_lines; i++)
    {
        float x = xd[i];
        float y = yd[i];
        float z = zd[i];

        // Ensure dim_idx is within bounds
        while(dim_idx < number_lines)
        {
            float xx = xd[dim_idx];
            float yy = yd[dim_idx];
            float zz = zd[dim_idx];

            // Compute angle using dot product
            float angle = x * xx + y * yy + z * zz;

            /* Correct precision errors */
            angle = fminf(angle, 1.0f);
            angle = acosf(angle) * 180.0f / M_PI;

            // Count pairs within the specified angle range
            if (angle < number_of_degrees)
            {
                atomicAdd(&temp[int(angle * points_per_degree)], 1.0f);
            }

            // Move to the next block of data
            dim_idx += blockDim.x * gridDim.x;
        }
        __syncthreads();
    }

    // Write results from shared to global memory
    atomicAdd(&ZZ[index], temp[index]);
}