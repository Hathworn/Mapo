#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Use reduction for inner products with loop unrolling
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        float sum = 0.0f;
        if (i < dim) sum += dY[i] * Y[i];
        if (i + blockDim.x < dim) sum += dY[i + blockDim.x] * Y[i + blockDim.x];
        if (i + 2 * blockDim.x < dim) sum += dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < dim) sum += dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x];
        tmp += sum;
    }

    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Perform parallel reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (idx < s) {
            reduction_buffer[idx] += reduction_buffer[idx + s];
        }
        __syncthreads();
    }

    // Compute gradient
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}