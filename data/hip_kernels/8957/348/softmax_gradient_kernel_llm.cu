#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    // Initialize temporary variable for partial sum
    float tmp = 0.0f;

    // Calculate dot product using multiple threads and sum results
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use one thread to sum up partial results across threads
    if (idx == 0) {
        for (int i = 1; i < blockDim.x; ++i) {
            reduction_buffer[0] += reduction_buffer[i];
        }
    }
    __syncthreads();

    // Compute gradient using the result from reduction
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}