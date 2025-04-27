#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define IDX2C(i, j, ld) ((j)*(ld)+(i))
#define SQR(x)      ((x)*(x))                        // x^2

__global__ void weighting_kernel(double const* matrices, double const* weights, double* results) {
    // Using shared memory to cache weights for improved performance
    __shared__ double shared_weights[blockDim.y];
    int tid_x = threadIdx.x;
    int tid_y = threadIdx.y;
    int block_index = blockDim.y * tid_x + tid_y;
    int matrix_index = blockIdx.x * blockDim.x * blockDim.y + block_index;
    
    // Load weights into shared memory
    if (tid_y == 0) {
        shared_weights[tid_x] = weights[blockIdx.x * blockDim.y + tid_x];
    }
    __syncthreads();

    // Compute result with cached weights
    results[matrix_index] = matrices[block_index] * shared_weights[tid_y];
}