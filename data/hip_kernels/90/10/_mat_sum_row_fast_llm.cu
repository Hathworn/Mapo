#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _mat_sum_row_fast(float *m, float *target, int nrow, int ncol, int agg_col) {
    int tx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use dynamic shared memory to size the array based on block size
    extern __shared__ float accum[];

    float sum = 0.0f;

    // Loop over columns to accumulate contributions
    for (int i = tx; i < ncol; i += blockDim.x * gridDim.x) {
        sum += m[blockIdx.y * ncol + i];
    }
    
    accum[threadIdx.x] = sum;
    __syncthreads();

    // Reduce within a block
    // Reduce shared memory in-place with a single warp
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            accum[threadIdx.x] += accum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // The first thread writes the final result
    if (threadIdx.x == 0) {
        target[blockIdx.y * agg_col + blockIdx.x] = accum[0];
    }
}