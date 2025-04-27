#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Initialize shared memory for reduction
    float sum_dY_Y = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        sum_dY_Y += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum_dY_Y;
    __syncthreads();

    // Sum reduction using binary tree method
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Broadcast the final result
    const float reduction_result = reduction_buffer[0];

    // Compute gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - reduction_result);
    }
}