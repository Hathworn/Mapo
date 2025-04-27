#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void forwardPropagation(float *a_d, float *b_d, int size)
{
    int idx = threadIdx.x;
    int idy = threadIdx.y;
    int global_idx = idy * (size + 1) + idx;

    __shared__ float temp[16][16];

    // Load data into shared memory
    temp[idy][idx] = a_d[global_idx];
    __syncthreads(); // Ensure shared memory is updated before proceeding

    // Optimize loop by reducing shared memory accesses and unnecessary computations
    for (int i = 1; i < size; i++)
    {
        if ((idy + i) < size)
        {
            float var1 = -temp[i-1][i-1] / temp[i+idy][i-1];
            // Use single shared memory access per thread iteration
            temp[i+idy][idx] += var1 * temp[i+idy][idx];
        }
        __syncthreads(); // Ensure all threads have finished before next iteration
    }

    // Store result back to global memory
    b_d[global_idx] = temp[idy][idx];
}