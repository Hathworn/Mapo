#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_len_dot() {
    extern __shared__ float partial_sums[]; // Use dynamic shared memory
    float* partial_len = partial_sums;
    float* partial_dot = partial_sums + blockDim.x;

    int index = threadIdx.x;
    int n = d_n_inputs_cols * d_nhid;
    float sum_len = 0.0f;
    float sum_dot = 0.0f;

    for (int i = blockIdx.x * blockDim.x + index; i < n; i += blockDim.x * gridDim.x) {
        float w_grad = d_w_grad[i]; // Load d_w_grad once
        sum_len += w_grad * w_grad;
        float prev_grad = d_prev_grad[i]; // Load d_prev_grad once
        sum_dot += w_grad * prev_grad;
        d_prev_grad[i] = w_grad;
    }

    partial_len[index] = sum_len;
    partial_dot[index] = sum_dot;
    __syncthreads();

    // Use loop unrolling to reduce operations
    for (int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (index < i) {
            partial_len[index] += partial_len[index + i];
            partial_dot[index] += partial_dot[index + i];
        }
        __syncthreads();
    }

    if (index == 0) {
        d_len_out[blockIdx.x] = partial_len[0];
        d_dot_out[blockIdx.x] = partial_dot[0];
    }
}