#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[]; // Use dynamic shared memory
    int idx = threadIdx.x;
    int offset = blockIdx.x * dim;

    float sum = 0.0f;

    // Perform first level of reduction
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[offset + i] * Y[offset + i];
    }
    
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Use parallel reduction to accumulate the results
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Use the total sum to compute gradient
    float final_sum = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[offset + i] = Y[offset + i] * (dY[offset + i] - final_sum);
    }
}