#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel for Gaussian Elimination
__global__ void gauss_elimination_cuda(float *a_d, float *b_d ,int size) {
    int idx = threadIdx.x;
    int idy = threadIdx.y;

    // Utilize shared memory to optimize data access
    __shared__ float temp[40][40];
    temp[idy][idx] = a_d[(idy * (size+1)) + idx];
    __syncthreads();

    // Perform Gaussian elimination
    for (int column = 0; column < size - 1; column++) {
        if (idy > column && idx >= column) {
            // Optimize by reducing redundant calculation
            float multiplier = temp[column][column] / temp[idy][column];
            float t = temp[column][idx] - multiplier * temp[idy][idx];
            __syncthreads();
            temp[idy][idx] = t;
        }
        __syncthreads();
    }

    // Write results back to global memory
    b_d[idy * (size + 1) + idx] = temp[idy][idx];
}