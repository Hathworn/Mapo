#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Compute partial sum for inner product in parallel
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use warp-level reduction for the final reduction step
    if (idx < 32) { // Assuming blockDim.x is a multiple of 32 (warp size)
        for (int i = idx + 32; i < blockDim.x; i += 32) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[idx] = tmp;
    }
    __syncthreads();

    // Compute the gradient using the reduced inner product value
    if (idx == 0) {
        tmp = 0.0f;
        for (int i = 0; i < min(blockDim.x, 32); ++i) {
            tmp += reduction_buffer[i]; // Only consider first warp
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}