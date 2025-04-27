#include "hip/hip_runtime.h"
#include "includes.h"

// Global kernel function optimized
__global__ void numMayor(float *d_v, float *d_pos){

    // Use shared memory to reduce global memory accesses
    __shared__ float s_temp;
    __shared__ float s_pos;

    // Initialize shared memory
    if (threadIdx.x == 0) {
        s_temp = 0;
        s_pos = 0;
    }
    __syncthreads();

    // Use block-level threading with stride for better performance
    float local_temp = 0;
    float local_pos = 0;
    for (int i = threadIdx.x; i < blockDim.x; i += blockDim.x) {
        if (d_v[i] > local_temp) {
            local_temp = d_v[i];
            local_pos = i;
        }
    }

    // Cooperative reduction within the block
    atomicMax(&s_temp, local_temp);
    __syncthreads();
    if (s_temp == local_temp) {
        atomicMax(&s_pos, local_pos);
    }
    __syncthreads();

    // Write results to global memory if thread 0
    if (threadIdx.x == 0) {
        if (s_pos > *d_pos)
            *d_pos = s_pos;
        *d_v = s_temp;
    }
}