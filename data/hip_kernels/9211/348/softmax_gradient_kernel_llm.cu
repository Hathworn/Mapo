#include "hip/hip_runtime.h"
#include "includes.h"

#define SOFTMAX_NUM_THREADS 256

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unrolled loop to improve memory access pattern
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Faster reduction using warp-level reduction
    if (idx < 32) {
        for (int i = idx + 32; i < blockDim.x; i += 32) {
            reduction_buffer[idx] += reduction_buffer[i];
        }
    }
    __syncthreads();

    // The reduction now only needs to be performed by one warp
    if (idx == 0) {
        tmp = 0.0f;
        for (int i = 0; i < 32; ++i) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Compute gradient with reduced memory latency
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}