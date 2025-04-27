#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float local_sum = 0.0f;

    // Efficient reduction using warp-level operations
    for (int i = idx; i < dim; i += blockDim.x) {
        local_sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = local_sum;
    __syncthreads();

    // Use a single warp to complete reduction
    if (idx < 32) {
        float warp_sum = reduction_buffer[idx];
        for (int offset = 32; offset < blockDim.x; offset += 32) {
            warp_sum += reduction_buffer[offset + idx];
        }
        reduction_buffer[idx] = warp_sum;
    }
    __syncthreads();

    // Compute gradient
    float grad_sum = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - grad_sum);
    }
}