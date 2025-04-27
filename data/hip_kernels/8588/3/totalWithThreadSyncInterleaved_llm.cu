#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void totalWithThreadSyncInterleaved(float *input, float *output, int len) {
    // Get shared memory buffer
    extern __shared__ float sdata[];

    // Load input data into shared memory
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;
    if (i < len) {
        sdata[tid] = input[i];
    } else {
        sdata[tid] = 0.0f; // Prevent out-of-bounds access
    }
    __syncthreads();

    // Perform reduction within shared memory
    for (unsigned int j = 1; j < blockDim.x; j *= 2) {
        if (tid % (2 * j) == 0) {
            sdata[tid] += sdata[tid + j];
        }
        __syncthreads();
    }

    // Write result to output
    if (tid == 0) {
        output[blockIdx.x] = sdata[0];
    }
}