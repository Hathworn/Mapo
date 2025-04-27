#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction(int *in, int *out) {
    int globalid = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ int s_array[]; // Use dynamic shared memory

    // Load input into shared memory
    s_array[threadIdx.x] = in[globalid];
    __syncthreads();

    // Perform reduction within the block
    for (unsigned int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            s_array[threadIdx.x] += s_array[threadIdx.x + i];
        }
        __syncthreads();
    }

    // Write the result of this block to output
    if (threadIdx.x == 0) {
        out[blockIdx.x] = s_array[0];
    }
}