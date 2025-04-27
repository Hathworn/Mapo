#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Initialize tmp and compute partial dot product using warp-level parallelism
    float tmp = 0;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Perform parallel reduction within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute gradient using reduced result
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}