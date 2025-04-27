#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];
    float tmp = 0.0f;

    // Unroll loop to improve performance.
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        tmp += (i < dim) ? (dY[i] * Y[i]) : 0.0f;
        if (i + blockDim.x < dim) tmp += dY[i + blockDim.x] * Y[i + blockDim.x];
        if (i + 2 * blockDim.x < dim) tmp += dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < dim) tmp += dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduce to single sum using warp-level reduction.
    if (idx < warpSize) { 
        for (int offset = warpSize / 2; offset > 0; offset /= 2) {
            tmp += __shfl_down(tmp, offset);
        }
    }
    if (idx == 0) {
        reduction_buffer[0] = tmp;
    }
    __syncthreads();

    // Compute gradient using the reduced sum.
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}