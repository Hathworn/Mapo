#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prefixSum_multiBlocks(float* in, int in_length, float* out, float* temp) {

    extern __shared__ float DSM[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory
    if (idx < in_length) {
        DSM[threadIdx.x] = in[idx];
    } else {
        DSM[threadIdx.x] = 0.0f; // Ensures all threads read initialized values
    }

    // Partial sums phase
    for (int stride = 1; stride <= blockDim.x; stride *= 2) {
        __syncthreads();
        int index_aux = (threadIdx.x + 1) * 2 * stride - 1;
        if (index_aux < blockDim.x) {
            DSM[index_aux] += DSM[index_aux - stride];
        }
    }

    // Reduction phase
    for (int stride = blockDim.x / 4; stride > 0; stride /= 2) {
        __syncthreads();
        int index_aux = (threadIdx.x + 1) * 2 * stride - 1;
        if (index_aux + stride < blockDim.x) {
            DSM[index_aux + stride] += DSM[index_aux];
        }
    }

    // Ensure all calculations are done before using DSM values
    __syncthreads();

    // Save the last element in each block to temp for post-combine operation
    if (threadIdx.x == 0) {
        temp[blockIdx.x] = DSM[blockDim.x - 1];
    }

    // Write results to output
    if (idx < in_length) {
        out[idx] = DSM[threadIdx.x];
    }
}