#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Advance pointers for the current batch element
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    // Thread index
    const int idx = threadIdx.x;
    // Shared memory buffer for reduction
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    // Per-thread accumulator
    float tmp = 0;

    // First level of reduction: each thread computes partial sum
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    
    // Store partial results in shared memory
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce within the block to calculate the final sum
    if (idx == 0) {
        float sum = 0;
        for (int i = 0; i < blockDim.x; ++i) {
            sum += reduction_buffer[i];
        }
        reduction_buffer[0] = sum;
    }
    __syncthreads();

    // Scalar value for all threads in the block
    const float final_sum = reduction_buffer[0];

    // Compute gradient: each thread updates multiple elements
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - final_sum);
    }
}