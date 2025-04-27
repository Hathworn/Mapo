#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    Y += blockIdx.x * dim;
    dY += blockIdx.x * dim;
    dX += blockIdx.x * dim;
    const int idx = threadIdx.x;
    __shared__ float shared_tmp[WARP_SIZE]; // Shared memory with Warp size

    float tmp = 0.0f;
    // Partial inner product in each thread
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }

    // Warp-level reduction for better shared memory efficiency
    __syncthreads();
    shared_tmp[idx] = tmp;
    if (idx < WARP_SIZE) {
        for (int offset = WARP_SIZE / 2; offset > 0; offset /= 2) {
            tmp += __shfl_down_sync(0xffffffff, tmp, offset);
        }
        if (idx == 0) {
            shared_tmp[0] = tmp; 
        }
    }
    __syncthreads();
   
    // Compute gradient
    tmp = shared_tmp[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}