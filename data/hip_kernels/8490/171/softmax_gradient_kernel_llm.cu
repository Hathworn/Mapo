#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    const int idx = threadIdx.x;
    float tmp = 0.0f;

    // Pointer offsets for each block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    // Compute partial sums for the inner product using stride loop
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Single thread reduction to accumulate final result
    if (idx == 0) {
        for (int i = 1; i < blockDim.x; ++i) {
            reduction_buffer[0] += reduction_buffer[i];
        }
    }
    __syncthreads();

    // Apply the gradient calculation using computed inner product
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}