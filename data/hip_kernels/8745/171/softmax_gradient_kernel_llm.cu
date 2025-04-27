#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // First level reduction using block-stride loop
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Warp-level reduction
    if (blockDim.x >= 64 && idx < 32) reduction_buffer[idx] += reduction_buffer[idx + 32];
    if (blockDim.x >= 32 && idx < 16) reduction_buffer[idx] += reduction_buffer[idx + 16];
    if (blockDim.x >= 16 && idx < 8) reduction_buffer[idx] += reduction_buffer[idx + 8];
    if (blockDim.x >= 8 && idx < 4) reduction_buffer[idx] += reduction_buffer[idx + 4];
    if (blockDim.x >= 4 && idx < 2) reduction_buffer[idx] += reduction_buffer[idx + 2];
    if (blockDim.x >= 2 && idx < 1) reduction_buffer[idx] += reduction_buffer[idx + 1];

    // Compute gradients after reduction
    if (idx == 0) tmp = reduction_buffer[0];
    __syncthreads();

    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}