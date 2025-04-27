#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unroll loop for better performance
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Optimize reduction with a loop unrolling method
    if (idx == 0) {
        tmp = 0.0f;
        for (int i = 0; i < blockDim.x; i += 4) {
            if (i < blockDim.x) tmp += reduction_buffer[i];
            if (i + 1 < blockDim.x) tmp += reduction_buffer[i + 1];
            if (i + 2 < blockDim.x) tmp += reduction_buffer[i + 2];
            if (i + 3 < blockDim.x) tmp += reduction_buffer[i + 3];
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Parallelize gradient computation
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}