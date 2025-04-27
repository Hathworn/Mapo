#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reductionKernel(float* vec, int width, double* sumUp){

    // shared memory instantiation
    extern __shared__ float partialSum[];

    // index for global memory
    int g_idx = blockDim.x * blockIdx.x + threadIdx.x;
    // index for shared memory
    int b_idx = threadIdx.x;

    // load shared memory from global memory
    partialSum[b_idx] = (g_idx < width) ? vec[g_idx] : 0;
    __syncthreads();  // Ensure all loads are complete

    // reduction inside blocks
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (b_idx < stride) {
            partialSum[b_idx] += partialSum[b_idx + stride];
        }
        __syncthreads();  // Synchronize to ensure all additions are complete
    }

    // reduction for grid using thread 0 of each block
    if (b_idx == 0) {
        // copy value back to global memory
        vec[blockIdx.x] = partialSum[0];
    }

    // Block 0 performs the final reduction across all blocks
    if (g_idx == 0) {
        double finalSum = 0.0;
        for (int i = 0; i < gridDim.x; ++i) {
            finalSum += vec[i];
        }
        *sumUp = finalSum;
    }
}