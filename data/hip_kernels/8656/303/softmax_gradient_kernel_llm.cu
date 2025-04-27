#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Offsetting pointer to the current batch block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float sum = 0.0f;
    // Unrolling loop for better performance
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Using warp-level reduction for faster processing
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        if (idx < offset)
            reduction_buffer[idx] += reduction_buffer[idx + offset];
        __syncthreads();
    }

    float tmp = reduction_buffer[0];
    // Compute gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}