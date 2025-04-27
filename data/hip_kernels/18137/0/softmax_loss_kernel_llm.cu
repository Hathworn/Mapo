#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_loss_kernel(float *reduced_loss, float *predict, float *target, float *workspace, int batch_size, int num_outputs)
{
    int batch_idx = blockDim.x * blockIdx.x + threadIdx.x;
    extern __shared__ float s_data[];
    float loss = 0.f;

    // Each thread calculates entropy for each data and accumulates to shared memory
    if(batch_idx < batch_size) {
        for (int c = 0; c < num_outputs; c++) {
            // Use of faster memory access techniques
            int idx = batch_idx * num_outputs + c;
            loss += target[idx] * logf(predict[idx]);
        }
        workspace[batch_idx] = -loss;
    } else {
        workspace[batch_idx] = 0.0f;
    }

    // Reduction using a single thread block if blockIdx.x == 0
    if (blockIdx.x > 0) return;

    s_data[threadIdx.x] = 0.f;

    // Cumulate workspace data with boundary check
    for (int i = threadIdx.x; i < batch_size; i += blockDim.x) {
        s_data[threadIdx.x] += workspace[i];
    }

    __syncthreads();

    // Reduction using warp shuffle for performance improvement
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride && threadIdx.x + stride < batch_size) {
            s_data[threadIdx.x] += s_data[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the final result to the output array
    if (threadIdx.x == 0) {
        reduced_loss[blockIdx.x] = s_data[0];
    }
}