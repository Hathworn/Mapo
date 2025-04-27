```c
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

    // Reduce dY * Y across threads using a warp-level reduction for better performance
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Efficient reduction using half the threads
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute gradient with reduced memory access
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}