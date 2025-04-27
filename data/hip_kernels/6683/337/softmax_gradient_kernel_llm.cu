#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Perform reduction within the block
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Only the first warp needs to perform reduction
    if (idx < 32) {
        #pragma unroll
        for (int i = 32; i < SOFTMAX_NUM_THREADS; i += 32) {
            tmp += reduction_buffer[idx + i];
        }
        reduction_buffer[idx] = tmp;

        #pragma unroll
        for (int offset = 16; offset > 0; offset /= 2) {
            tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
        }

        if (idx == 0) {
            reduction_buffer[0] = tmp;
        }
    }
    __syncthreads();

    // Compute gradient
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}