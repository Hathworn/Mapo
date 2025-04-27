#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[]; // Use dynamic shared memory
    float tmp = 0.0f;
    int idx = threadIdx.x;
    int offset = blockIdx.x * dim;
    
    // Compute local sum for reduction
    for (int i = idx; i < dim; i += blockDim.x) {
        float y_val = Y[offset + i];
        tmp += dY[offset + i] * y_val;
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Warp reduction to speed up global reduction
    if (idx < 32) {
        for (int i = blockDim.x / 2; i > 32; i >>= 1) {
            tmp += reduction_buffer[idx + i];
            reduction_buffer[idx] = tmp;
            __syncthreads();
        }
    }
    
    // Final warp-level reduction
    if (idx < 32) {
        for (int i = 16; i > 0; i >>= 1) {
            tmp += __shfl_down(tmp, i);
        }
    }

    if (idx == 0) reduction_buffer[0] = tmp;
    __syncthreads();

    // Compute gradient.
    float sum = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[offset + i] = Y[offset + i] * (dY[offset + i] - sum);
    }
}