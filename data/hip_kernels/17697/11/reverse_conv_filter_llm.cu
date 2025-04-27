#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Use shared memory and eliminate frequent global memory accesses
__global__ void reverse_conv_filter(const float* __restrict__ x, float beta, float* __restrict__ y, unsigned int filter_len, unsigned int len) {
    extern __shared__ float shared_x[]; // Shared memory for block's portion of x
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;

    if (tid < len) {
        // Load data to shared memory
        for (int i = local_tid; i < filter_len; i += blockDim.x) {
            shared_x[i] = x[tid * filter_len + i];
        }
        __syncthreads();

        if (beta == 0.0f) {
            for (int i = 0; i < filter_len; ++i) {
                y[tid * filter_len + i] = shared_x[(filter_len - 1) - i]; // Use shared memory
            }
        } else {
            for (int i = 0; i < filter_len; ++i) {
                y[tid * filter_len + i] = shared_x[(filter_len - 1) - i] + beta * y[tid * filter_len + i];
            }
        }
    }
}