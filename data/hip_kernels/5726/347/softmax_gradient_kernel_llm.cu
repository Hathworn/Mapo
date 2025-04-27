#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Offset pointers for this block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    
    // Thread index and shared memory
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // First level of reduction: each thread computes partial sum
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Second level of reduction: accumulate results across all threads
    if (idx == 0) {
        float sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            sum += reduction_buffer[i];
        }
        reduction_buffer[0] = sum;
    }
    __syncthreads();

    // Compute the gradients using the inner product result
    const float sum = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - sum);
    }
}