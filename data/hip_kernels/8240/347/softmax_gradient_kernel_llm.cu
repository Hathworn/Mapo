#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Use warp-level operations for reduction within warps
    float tmp = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }

    // Perform warp-wise reduction
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
    }

    // Reduction among warps using shared memory
    if (idx % warpSize == 0) {
        reduction_buffer[idx / warpSize] = tmp;
    }
    __syncthreads();

    // Final reduction within shared memory
    if (idx < (blockDim.x / warpSize)) {
        tmp = reduction_buffer[idx];
        for (int i = (blockDim.x / warpSize) + idx; i < SOFTMAX_NUM_THREADS; i += blockDim.x / warpSize) {
            tmp += reduction_buffer[i];
        }
    }
    __syncthreads();

    if (idx < warpSize) {
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