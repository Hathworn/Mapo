#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Initialize local accumulation variable
    float local_sum = 0.0f;

    // Perform partial reduction in a loop using thread-stride
    for (int i = idx; i < dim; i += blockDim.x) {
        local_sum += dY[i] * Y[i];
    }

    // Store partial results in shared memory
    reduction_buffer[idx] = local_sum;
    __syncthreads();

    // Reduce within the block to form the total inner product
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Broadcasting the final result to all threads
    float inner_product = reduction_buffer[0];

    // Compute gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - inner_product);
    }
}