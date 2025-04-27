```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce_max_kernel(float *d_out, const float *d_logLum, int size) {

    int tid  = threadIdx.x;                             // Local thread index
    int myId = blockIdx.x * blockDim.x + threadIdx.x;   // Global thread index

    extern __shared__ float temp[];

    // Load data to shared memory or set to a default minimum value if out of bounds
    temp[tid] = (myId < size) ? d_logLum[myId] : -FLT_MAX;  // Use defined constant for minimum float value
    __syncthreads(); // Ensure all loads are complete before reduction

    // Unroll the reduction loop for better performance
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            temp[tid] = fmaxf(temp[tid], temp[tid + s]);
        }
        __syncthreads(); // Ensure all memory operations are complete
    }

    // Write the result of the block's reduction to global output
    if (tid == 0) {
        d_out[blockIdx.x] = temp[0];
    }
}