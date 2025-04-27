#include "hip/hip_runtime.h"
#include "includes.h"

#define SOFTMAX_NUM_THREADS 256

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[]; // Use dynamic shared memory

    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int idx = threadIdx.x;
    float tmp = 0;

    // One-level reduction to compute the inner products.
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use parallel reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    tmp = reduction_buffer[0]; // The final sum result

    // Compute gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}