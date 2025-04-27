#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unroll loop to reduce instruction overhead
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use warp reduction for better performance on reductions
    if (blockDim.x >= 32) {
        if (idx < 16) {
            reduction_buffer[idx] += reduction_buffer[idx + 16];
            reduction_buffer[idx] += reduction_buffer[idx + 8];
            reduction_buffer[idx] += reduction_buffer[idx + 4];
            reduction_buffer[idx] += reduction_buffer[idx + 2];
            reduction_buffer[idx] += reduction_buffer[idx + 1];
        }
    }

    if (idx == 0) {
        float sum = 0.0f;
        for (int i = 0; i < 32; ++i) {  // assuming SOFTMAX_NUM_THREADS is a multiple of 32
            sum += reduction_buffer[i];
        }
        reduction_buffer[0] = sum;
    }
    __syncthreads();

    // Compute gradient with updated tmp value
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}