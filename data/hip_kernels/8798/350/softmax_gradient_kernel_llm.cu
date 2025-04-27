#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    
    // Shared memory for reduction
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0;

    // Efficient reduction using warp intrinsics
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();
    
    // Perform reduction using the first warp
    if (idx < warpSize) { // Avoid launching unnecessary threads
        tmp = 0;
        for (int i = idx; i < SOFTMAX_NUM_THREADS; i += warpSize) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[idx] = tmp;
    }
    __syncthreads();

    // Use a single thread to aggregate results
    if (idx == 0) {
        tmp = 0;
        for (int i = 0; i < warpSize; ++i) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();
    
    // Compute gradient
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}