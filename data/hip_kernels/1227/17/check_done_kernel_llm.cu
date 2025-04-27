#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void check_done_kernel(bool *mask, int num_vtx, bool *finished) {

    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    bool local_finished = true; // Local variable to reduce global memory access

    while (tid < num_vtx) {
        if (mask[tid]) {
            local_finished = false;
            break; // Exit loop early if condition is met
        }
        tid += blockDim.x * gridDim.x;
    }

    // Perform reduction across all threads in the block
    __shared__ bool block_finished;
    if (threadIdx.x == 0) {
        block_finished = true;
    }
    __syncthreads();

    atomicAnd(&block_finished, local_finished);
    __syncthreads();

    if (threadIdx.x == 0 && !block_finished) {
        *finished = false;
    }
}