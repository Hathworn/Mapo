#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Use a single loop for reduction and compute partial inner product.
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduction using warp shuffle to avoid multiple __syncthreads
    if (idx < 32) {
        for (int offset = warpSize / 2; offset > 0; offset /= 2) {
            tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
        }
        if (idx == 0) {
            reduction_buffer[0] = tmp;
        }
    }
    __syncthreads();

    // Compute gradient using reduced value.
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}