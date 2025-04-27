#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float tmp = 0.0f;
    
    // Unroll loop for efficiency
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use a single warp for reduction if possible
    if (idx < 32) {
        for (int i = idx + 32; i < blockDim.x; i += 32) {
            reduction_buffer[idx] += reduction_buffer[i];
        }
        for (int offset = 16; offset > 0; offset /= 2) {
            reduction_buffer[idx] += __shfl_down_sync(0xffffffff, reduction_buffer[idx], offset);
        }
    }

    if (idx == 0) {
        reduction_buffer[0] = tmp = reduction_buffer[0];
    }
    __syncthreads();

    // Compute gradient
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}