#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unroll the loop for better performance
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        tmp += (i < dim) ? dY[i] * Y[i] : 0.0f;
        tmp += (i + blockDim.x < dim) ? dY[i + blockDim.x] * Y[i + blockDim.x] : 0.0f;
        tmp += (i + 2 * blockDim.x < dim) ? dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x] : 0.0f;
        tmp += (i + 3 * blockDim.x < dim) ? dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x] : 0.0f;
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use a more efficient reduction method
    for (int offset = blockDim.x / 2; offset > 0; offset /= 2) {
        if (idx < offset) {
            reduction_buffer[idx] += reduction_buffer[idx + offset];
        }
        __syncthreads();
    }

    // Compute gradient using final reduction result
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}