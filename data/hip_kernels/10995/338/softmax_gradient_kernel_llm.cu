#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Efficient reduction using warp-level operations
    float tmp = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();
    
    // Warp-level reduction
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
       tmp += __shfl_down_sync(0xFFFFFFFF, tmp, offset);
    }
    
    if (idx % warpSize == 0) {
        atomicAdd(&reduction_buffer[0], tmp);
    }
    __syncthreads();
    
    // Compute gradient with improved memory access
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}