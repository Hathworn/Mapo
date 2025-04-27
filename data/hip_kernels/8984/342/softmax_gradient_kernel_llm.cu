#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float sum = 0.0f; // Local variable to accumulate the product
    // Unroll loop for better performance
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Use warp shuffle for optimized reduction
    if (idx < 32) {
        for (int offset = 32 / 2; offset > 0; offset /= 2) {
            sum += __shfl_down(sum, offset);
        }
    }
    
    if (idx == 0) {
        reduction_buffer[0] = sum;
    }
    __syncthreads();

    // Compute gradient
    float tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}