#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateBiasKernel_softmax(float* dZ, float* b, int cols, int row, float learning_rate) {
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    // Use warp reduction for performance improvement
    float* sp = dZ + cols * bid;
    float local_sum = 0.0f;

    for (int id = threadIdx.x; id < cols; id += blockDim.x) {
        local_sum += sp[id];
    }

    _share[threadIdx.x] = local_sum;
    __syncthreads();

    // Perform reduction within the block
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            _share[threadIdx.x] += _share[threadIdx.x + s];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        b[bid] -= learning_rate * (_share[0] / cols);
    }
}