#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim; // Move the pointers to the softmax part for this block
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x; // Thread index within the block
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS]; // Shared memory for the reduction
    float tmp = 0.0f;

    // First reduction step - compute dY * Y and sum within each thread
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce the sums within the block into reduction_buffer[0]
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // tmp now holds the sum
    tmp = reduction_buffer[0];

    // Compute the gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}