#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0;

    // Unroll the loop to improve performance
    for (int i = idx; i < dim; i += blockDim.x * 2) {
        tmp += dY[i] * Y[i];
        if(i + blockDim.x < dim) {
            tmp += dY[i + blockDim.x] * Y[i + blockDim.x];
        }
    }
    
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use tree-based reduction for better performance
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute gradient
    if (idx == 0) tmp = reduction_buffer[0];
    __syncthreads();
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}