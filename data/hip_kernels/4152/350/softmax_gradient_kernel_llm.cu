#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float tmp = 0.0f;

    // Accumulate inner products using a warp reduction
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }

    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Perform a warp reduction to accumulate results
    if (idx < 32) {
        tmp = reduction_buffer[idx];
        for (int offset = 32; offset < blockDim.x; offset += 32) {
            tmp += reduction_buffer[idx + offset];
        }
        reduction_buffer[idx] = tmp;
    }
    __syncthreads();

    // Compute gradient using the reduced inner product
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}