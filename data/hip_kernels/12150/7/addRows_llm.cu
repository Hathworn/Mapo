#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addRows(double *matrix, int *d_i) {
    int i = *d_i;
    int n = blockDim.x + i;
    int id = n * (blockIdx.x + i + 1) + threadIdx.x + i;
    __shared__ double multiplier;

    // Move condition check outside to only set by thread 0
    if(threadIdx.x == 0) {
        multiplier = matrix[n * (blockIdx.x + 1 + i) + i] / matrix[n * i + i];
    }
    __syncthreads();

    // Use a separate variable to compute and access shared memory efficiently
    double matrix_val = matrix[n * i + threadIdx.x + i];

    // Reduce matrix access by using precomputed values
    matrix[id] -= matrix_val * multiplier;
}