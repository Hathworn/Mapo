```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Adjust pointers for each block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int idx = threadIdx.x;

    // Use shared memory for reduction
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float local_sum = 0.0f;

    // Perform initial dot product computation using each thread
    for (int i = idx; i < dim; i += blockDim.x) {
        local_sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = local_sum;
    __syncthreads();

    // Perform reduction using a single thread
    if (idx == 0) {
        float final_sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            final_sum += reduction_buffer[i];
        }
        reduction_buffer[0] = final_sum;
    }
    __syncthreads();

    // Compute gradient using updated reduction result
    float dot_product_result = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - dot_product_result);
    }
}