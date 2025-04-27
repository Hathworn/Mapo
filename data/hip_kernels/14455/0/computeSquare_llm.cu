#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeSquare(int *d_in, int *d_out) {
    // Optimize to use shared memory
    __shared__ int shared_in[256]; // Assuming the max block size is 256
    int index = threadIdx.x;
    shared_in[index] = d_in[index];
    __syncthreads();
    d_out[index] = shared_in[index] * shared_in[index];
}