#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Initialize shared memory and compute partial results
    float sum = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Reduction phase: compute total sum using parallel reduction
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (idx < offset) {
            reduction_buffer[idx] += reduction_buffer[idx + offset];
        }
        __syncthreads();
    }

    // Fetch final result from reduction
    float total_sum = reduction_buffer[0];
    
    // Compute gradient
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - total_sum);
    }
}