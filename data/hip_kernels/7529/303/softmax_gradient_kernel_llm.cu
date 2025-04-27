#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float local_sum = 0.0f;

    // Efficient parallel reduction to compute the inner products
    for (int i = idx; i < dim; i += blockDim.x) {
        local_sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = local_sum;
    __syncthreads();

    // Warp-level reduction for better performance in reduction phase
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (idx < offset) {
            reduction_buffer[idx] += reduction_buffer[idx + offset];
        }
        __syncthreads();
    }
    
    // Compute gradient using the reduction result
    float dot_product = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - dot_product);
    }
}
```
