#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float tmp = 0;

    // Reduce inner products using loop unrolling for efficiency
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce using a single warp for final reduction if within one warp
    if (idx < warpSize) {
        #pragma unroll
        for (int stride = warpSize / 2; stride > 0; stride /= 2) {
            tmp += __shfl_down_sync(0xffffffff, tmp, stride);
        }
    }

    // First thread writes the reduced result for all threads
    if (idx == 0) {
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Each thread computes its part of gradients.
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}