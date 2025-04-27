#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float reduction_buffer[SOFTMAX_NUM_THREADS];

    float sum = 0.0f;

    // First level reduction using warp-synchronous method for efficiency.
    for (int i = idx; i < dim; i += blockDim.x) {
        sum += dY[i] * Y[i];
    }
    reduction_buffer[idx] = sum;

    // Warp-level reduction
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        sum += __shfl_down(sum, offset);
    }

    if ((idx % warpSize) == 0) {
        atomicAdd(&reduction_buffer[0], sum);  // Use atomic operation for inter-warp summation.
    }

    __syncthreads();

    // Compute gradient after reduction is finalized.
    float reduction_sum = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - reduction_sum);
    }
}