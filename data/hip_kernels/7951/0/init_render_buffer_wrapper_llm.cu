#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void init_render_buffer(int64_t* render_buffer, const uint32_t qw_count) {
    const uint32_t start = blockIdx.x * blockDim.x + threadIdx.x;
    const uint32_t step = blockDim.x * gridDim.x;
    for (uint32_t i = start; i < qw_count; i += step) {
        render_buffer[i] = EMPTY_KEY_64;
    }
}

__global__ void init_render_buffer_wrapper(int64_t* render_buffer, const uint32_t qw_count) {
    // Using shared memory to avoid redundant global memory accesses
    __shared__ int64_t shared_render_buffer[256];
    const uint32_t tid = threadIdx.x;

    // Load shared memory with initial values
    if (tid < qw_count) {
        shared_render_buffer[tid] = render_buffer[tid];
    }
    __syncthreads();

    // Initialize buffer using shared memory
    init_render_buffer(shared_render_buffer, qw_count);

    __syncthreads();

    // Write back from shared memory to global memory
    if (tid < qw_count) {
        render_buffer[tid] = shared_render_buffer[tid];
    }
}