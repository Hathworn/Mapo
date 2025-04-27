#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[]; // Use dynamic shared memory
    const int idx = threadIdx.x;
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    float tmp = 0;

    // Unroll loop for better performance; vectorize memory access
    for (int i = idx; i < dim; i += blockDim.x * 4) {
        float local_tmp = 0;
        if (i < dim) local_tmp += dY[i] * Y[i];
        if (i + blockDim.x < dim) local_tmp += dY[i + blockDim.x] * Y[i + blockDim.x];
        if (i + 2 * blockDim.x < dim) local_tmp += dY[i + 2 * blockDim.x] * Y[i + 2 * blockDim.x];
        if (i + 3 * blockDim.x < dim) local_tmp += dY[i + 3 * blockDim.x] * Y[i + 3 * blockDim.x];
        tmp += local_tmp;
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Use warp-level reductions
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (idx < stride) {
            reduction_buffer[idx] += reduction_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute the gradient and store the result
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}