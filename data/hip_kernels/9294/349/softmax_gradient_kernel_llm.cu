#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[];
    const int idx = threadIdx.x;
    const int block_offset = blockIdx.x * dim;

    float partial_sum = 0.0f;

    // Compute partial dot product
    for (int i = idx; i < dim; i += blockDim.x) {
        partial_sum += dY[block_offset + i] * Y[block_offset + i];
    }
    reduction_buffer[idx] = partial_sum;
    __syncthreads();

    // Complete reduction using warp-level primitives
    if (idx < 32) {
        #pragma unroll
        for (int offset = 32; offset < blockDim.x; offset *= 2) {
            partial_sum += (idx + offset < blockDim.x) ? reduction_buffer[idx + offset] : 0.0f;
            reduction_buffer[idx] = partial_sum;
            __syncthreads();
        }
    }

    // Broadcast the reduced result
    const float total_sum = reduction_buffer[0];

    // Compute gradient in parallel
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[block_offset + i] = Y[block_offset + i] * (dY[block_offset + i] - total_sum);
    }
}