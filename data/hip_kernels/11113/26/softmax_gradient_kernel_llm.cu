#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    // Offset pointers to this block's data
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;

    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Initialize shared memory for reduction
    reduction_buffer[idx] = 0.0f;

    // Partial reduction in global memory
    float sum = 0.0f;
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;
    __syncthreads();

    // Single-threaded reduction of shared memory
    if (idx == 0) {
        sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            sum += reduction_buffer[i];
        }
        reduction_buffer[0] = sum;
    }
    __syncthreads();

    // Calculate gradient using the final reduction result
    float inner_product = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - inner_product);
    }
}