#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    float sum = 0;
    // Unroll loop to improve performance.
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Optimize reduction using binary tree.
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    sum = reduction_buffer[0];

    // Compute gradient, optimizing for memory coalescing.
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - sum);
    }
}