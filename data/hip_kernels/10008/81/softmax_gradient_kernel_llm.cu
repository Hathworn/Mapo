#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Initialize shared buffer
    reduction_buffer[idx] = 0; 
    __syncthreads();

    // Efficient reduction using warp shuffle
    float tmp = 0;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    atomicAdd(&reduction_buffer[0], tmp);
    __syncthreads();
    
    // Barrier to ensure reduction is complete
    tmp = reduction_buffer[0];
    
    // Compute gradient with improved memory access pattern
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}