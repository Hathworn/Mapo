#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    
    float tmp = 0;

    // Load data into registers and reduce across warp using warp reduce
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use warp reduction to minimize synchronization overhead
    if (idx < 32) { // Assume blockDim.x is a multiple of warp size
        for (int i = idx + 32; i < blockDim.x; i += 32) {
            reduction_buffer[idx] += reduction_buffer[i];
        }
    }
    __syncthreads(); // Ensure warp reduction is complete

    if (idx == 0) {
        for (int i = 1; i < 32; ++i) {
            reduction_buffer[0] += reduction_buffer[i];
        }
    }
    __syncthreads(); // Ensure reduction computation is complete

    // Compute gradient using the reduced sum
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}