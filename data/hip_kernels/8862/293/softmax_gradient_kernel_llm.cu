```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Initialize shared memory buffer
    reduction_buffer[idx] = 0.0f;
    __syncthreads();

    // Optimize reduction for better memory coalescing
    for (int i = idx; i < dim; i += blockDim.x) {
        reduction_buffer[idx] += dY[i] * Y[i];
    }
    __syncthreads();

    // Optimized accumulation using single warp reduction
    if (idx < 32) {
        float sum = reduction_buffer[idx];
        for (int offset = 32; offset < blockDim.x; offset += 32) {
            sum += reduction_buffer[idx + offset];
        }
        reduction_buffer[idx] = sum;

        if (idx == 0) {
            for (int i = 1; i < 32; ++i)
                sum += reduction_buffer[i];
            reduction_buffer[0] = sum;
        }
    }
    __syncthreads();

    // Compute gradient using updated temporary value
    float tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}