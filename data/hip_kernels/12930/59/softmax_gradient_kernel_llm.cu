#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_gradient_kernel(const int dim, const float* Y, const float* dY, float* dX) {
    extern __shared__ float reduction_buffer[]; // Use dynamic shared memory
    const int idx = threadIdx.x;
    const int offset = blockIdx.x * dim;
    Y += offset;
    dY += offset;
    dX += offset;
    
    // Optimized reduction using grid-stride loop
    float tmp = 0;
    for (int i = idx; i < dim; i += blockDim.x) {
        tmp += dY[i] * Y[i];
    }
    reduction_buffer[idx] = tmp;
    __syncthreads();

    // Reduction using warp shuffle for better efficiency
    if (idx < warpSize) {
        for (int i = warpSize; i < blockDim.x; i += warpSize) {
            if (idx + i < blockDim.x) tmp += reduction_buffer[idx + i];
        }
        for (int offset = warpSize/2; offset > 0; offset /= 2) {
            tmp += __shfl_down(tmp, offset);
        }
    }

    if (idx == 0) reduction_buffer[0] = tmp;
    __syncthreads();
    
    tmp = reduction_buffer[0];
    for (int i = idx; i < dim; i += blockDim.x) {
        dX[i] = Y[i] * (dY[i] - tmp);
    }
}