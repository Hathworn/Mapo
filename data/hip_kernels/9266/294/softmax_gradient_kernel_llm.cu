#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;

    extern __shared__ float shared_buffer[]; // Use dynamically allocated shared memory
    float local_sum = 0.0f;

    // Compute partial sum for dot product using warp-level reduction
    for (int i = idx; i < dim; i += blockDim.x) {
        local_sum += dY[i] * Y[i];
    }
    shared_buffer[idx] = local_sum;
    __syncthreads();

    // Use parallel reduction for higher efficiency
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            shared_buffer[idx] += shared_buffer[idx + stride];
        }
        __syncthreads();
    }

    // Compute gradient
    const float dot_product = shared_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - dot_product); // Efficient direct calculation
    }
}