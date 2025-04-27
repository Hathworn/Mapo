#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0;

    // First reduction level: compute partial dot products
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Second reduction level: accumulate total dot product using atomic addition for efficiency
    if (idx == 0) {
        tmp = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            tmp += reduction_buffer[i];
        }
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Compute gradients
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}