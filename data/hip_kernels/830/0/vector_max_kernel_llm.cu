#include "hip/hip_runtime.h"
#include "includes.h"

const int threads_per_block = 256;

__global__ void vector_max_kernel(float *in, float *out, int N) {
    int block_id = blockIdx.x + gridDim.x * blockIdx.y;
    int thread_id = blockDim.x * block_id + threadIdx.x;
    int tid = threadIdx.x;

    // Shared memory for maximum value in each block
    __shared__ float shared_max[threads_per_block];

    // Load input value into shared memory
    float local_max = (thread_id < N) ? in[thread_id] : -FLT_MAX;
    shared_max[tid] = local_max;
    __syncthreads();

    // Reduction to find maximum in the block, using shared memory
    for (int stride = threads_per_block / 2; stride > 0; stride >>= 1) {
        if (tid < stride && thread_id + stride < N) {
            shared_max[tid] = fmaxf(shared_max[tid], shared_max[tid + stride]);
        }
        __syncthreads();
    }

    // Write the block's maximum to the output
    if (tid == 0) {
        out[block_id] = shared_max[0];
    }
}