#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel( const int dim, const float* Y, const float* dY, float* dX) {
    // Adjust pointers for this block
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    float thread_sum = 0;

    // Perform a reduction to compute the inner product
    for (int i = idx; i < dim; i += blockDim.x) {
        thread_sum += dY[i] * Y[i];
    }
    
    // Store in shared buffer for reduction
    reduction_buffer[idx] = thread_sum;
    __syncthreads();

    // Perform parallel reduction using grid-reduction pattern
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute gradient using the reduction result
    float reduction_result = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - reduction_result);
    }
}