#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Partial sum for the inner products
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Single thread reduction to compute the sum across threads
    if (idx == 0) {
        tmp = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Compute gradient using the calculated sum
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}