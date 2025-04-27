#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float threadSum = 0.0f;

    // First level reduction within threads
    for (int i = idx; i < dim; i += blockDim.x) {
        threadSum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = threadSum;
    __syncthreads();

    // Warp-level reduction
    if (blockDim.x >= 64) { if (idx < 32) reduction_buffer[idx] += reduction_buffer[idx + 32]; } __syncthreads();
    if (blockDim.x >= 32) { if (idx < 16) reduction_buffer[idx] += reduction_buffer[idx + 16]; } __syncthreads();
    if (blockDim.x >= 16) { if (idx < 8)  reduction_buffer[idx] += reduction_buffer[idx + 8];  } __syncthreads();
    if (blockDim.x >= 8)  { if (idx < 4)  reduction_buffer[idx] += reduction_buffer[idx + 4];  } __syncthreads();
    if (blockDim.x >= 4)  { if (idx < 2)  reduction_buffer[idx] += reduction_buffer[idx + 2];  } __syncthreads();
    if (blockDim.x >= 2)  { if (idx < 1)  reduction_buffer[idx] += reduction_buffer[idx + 1];  } __syncthreads();

    float sum = reduction_buffer[0];
    // Compute gradients
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - sum);
    }
}