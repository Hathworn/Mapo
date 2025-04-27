#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[];  // Use dynamic shared memory

    // Compute global linear index
    int global_idx = blockIdx.x * dim + threadIdx.x;

    float sum = 0.0f;
    // Unroll loop to reduce iterations and improve performance
    for (int i = threadIdx.x; i < dim; i += blockDim.x) {
        sum += dY[global_idx + i] * Y[global_idx + i];
    }
    
    reduction_buffer[threadIdx.x] = sum;
    __syncthreads();

    // Efficient parallel reduction within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            reduction_buffer[threadIdx.x] += reduction_buffer[threadIdx.x + stride];
        }
        __syncthreads();
    }

    float total_sum = reduction_buffer[0];
    
    // Calculate gradient using shared total_sum
    for (int i = threadIdx.x; i < dim; i += blockDim.x) {
        dX[global_idx + i] = Y[global_idx + i] * (dY[global_idx + i] - total_sum);
    }
}