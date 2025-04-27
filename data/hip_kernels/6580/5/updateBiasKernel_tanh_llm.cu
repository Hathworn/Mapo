#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateBiasKernel_tanh(float* dZ, float* b, int cols, int row, float learning_rate) {
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    float* _sum = _share;
    float* sp = dZ + cols * bid;
    _sum[threadIdx.x] = 0.0;

    // Parallel reduction using shared memory
    for (int id = threadIdx.x; id < cols; id += blockDim.x) {
        _sum[threadIdx.x] += sp[id];
    }
    __syncthreads();

    // Reduce shared memory values
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            _sum[threadIdx.x] += _sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Update bias using the result from the reduction
    if (threadIdx.x == 0) {
        b[bid] -= learning_rate * (_sum[0] / cols);
    }
}