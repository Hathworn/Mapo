#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduce_kernel(float * d_out, float * d_in) {
    int myId = threadIdx.x + 2 * blockDim.x * blockIdx.x;
    int tid = threadIdx.x;
    // Optimization: use shared memory for reduction
    extern __shared__ float shared_data[];
    shared_data[tid] = d_in[myId] + d_in[myId + blockDim.x];
    __syncthreads();

    // Reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            shared_data[tid] += shared_data[tid + s];
        }
        __syncthreads();  // Synchronize threads at each stage of reduction
    }

    // Only thread 0 writes result for this block back to global memory
    if (tid == 0) {
        d_out[blockIdx.x] = shared_data[0];
    }
}