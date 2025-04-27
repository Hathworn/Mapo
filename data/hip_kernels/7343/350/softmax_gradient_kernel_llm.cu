#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Pre-compute offsets once
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0;

    // Efficient reduction - avoid bank conflicts
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Single block reduction - reduce computation overhead
    if (idx == 0) {
        for (int i = 1; i < blockDim.x; ++i) {
            reduction_buffer[0] += reduction_buffer[i];
        }
    }
    __syncthreads();

    tmp = reduction_buffer[0];
    // Parallelize gradient calculation
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}