#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Use extern shared memory for dynamic allocations
    extern __shared__ float reduction_buffer[];

    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    const int block_size = blockDim.x;
    float tmp = 0.0f;

    // Efficient parallel reduction to compute inner products using shared memory
    for (int i = idx; i < dim; i += block_size) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = block_size / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    tmp = reduction_buffer[0];

    // Compute gradient
    for (int i = idx; i < dim; i += block_size) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}