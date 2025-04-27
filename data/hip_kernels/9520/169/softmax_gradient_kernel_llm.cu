#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float tmp = 0.0f;

    // Use warp reduction to optimize the reduction step
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce within a block using warp shuffle
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2) {
        tmp += __shfl_down_sync(0xffffffff, tmp, offset);
    }
    
    if (idx == 0) {
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Compute gradient using the reduced result
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}