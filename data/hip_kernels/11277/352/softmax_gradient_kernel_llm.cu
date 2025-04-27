#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    // Initialize shared memory to zero
    float sum_dY_Y = 0.0f;

    // Perform reduction within each block
    for (int i = idx; i < dim; i += blockDim.x) {
        sum_dY_Y += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum_dY_Y;
    __syncthreads();

    // Reduce the results from each thread to a single value in the block's shared memory
    if (idx == 0) {
        float block_sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            block_sum += reduction_buffer[i];
        }
        reduction_buffer[0] = block_sum;
    }
    __syncthreads();

    // Compute the gradient using the reduced sum
    float tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}