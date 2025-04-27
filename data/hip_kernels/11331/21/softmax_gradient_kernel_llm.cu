#include "hip/hip_runtime.h"
#include "includes.h"

#define SOFTMAX_NUM_THREADS 256

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0;

    // Unroll loop for better parallel execution
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        tmp += dY[i] * Y[i];
        if (i + blockDim.x < dim) tmp += dY[i + blockDim.x] * Y[i + blockDim.x];
        if (i + 2 * blockDim.x < dim) tmp += dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < dim) tmp += dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Optimize reduction with atomic addition
    if (idx == 0) {
        tmp = reduction_buffer[0];
        for (int i = 1; i < blockDim.x; ++i) {
            atomicAdd(&tmp, reduction_buffer[i]);
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Unroll loop for gradient computation
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        dX[i] = Y[i] * (dY[i] - tmp);
        if (i + blockDim.x < dim) dX[i + blockDim.x] = Y[i + blockDim.x] * (dY[i + blockDim.x] - tmp);
        if (i + 2 * blockDim.x < dim) dX[i + 2 * blockDim.x] = Y[i + 2 * blockDim.x] * (dY[i + 2 * blockDim.x] - tmp);
        if (i + 3 * blockDim.x < dim) dX[i + 3 * blockDim.x] = Y[i + 3 * blockDim.x] * (dY[i + 3 * blockDim.x] - tmp);
    }
}