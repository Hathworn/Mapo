#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float thread_sum = 0.0f;
    // Use unrolled loop for better performance.
    for (int i = idx; i < dim; i += blockDim.x) {
        thread_sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = thread_sum;
    __syncthreads();

    // Optimize reduction with parallel tree reduction.
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    float inner_product = reduction_buffer[0];

    // Compute gradient.
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - inner_product);
    }
}