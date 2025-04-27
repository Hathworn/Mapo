#include "hip/hip_runtime.h"
#include "includes.h"
#define block_size 256  // Define block size as needed

__global__ void calculation(char *a, char *b, int *c, int constant, int vector_size) {
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;  // Calculate global thread id

    __shared__ char sharedDataA[block_size + 2]; // Shared memory with padding for borders
    char curr_b;

    // Use padding to avoid conditional statements for shared memory borders
    int sharedIdx = threadIdx.x + 1;
    sharedDataA[sharedIdx] = (tid < vector_size) ? a[tid] : 0;
    if (threadIdx.x == 0) {
        sharedDataA[0] = a[(tid > 0) ? (tid - 1) : (vector_size - 1)];
    }
    if (threadIdx.x == block_size - 1) {
        sharedDataA[block_size + 1] = a[(tid < vector_size - 1) ? (tid + 1) : 0];
    }

    curr_b = (tid < vector_size) ? b[tid] : 0;

    __syncthreads();

    if (tid < vector_size) {
        int output_c = (sharedDataA[sharedIdx - 1] - sharedDataA[sharedIdx + 1]) * curr_b;  // Calculate using neighbors
        output_c += sharedDataA[sharedIdx] * constant;
        c[tid] = output_c;  // Store result
    }
}