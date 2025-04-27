#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void updateBiasKernel_sigmoid(float* dZ, float* b, int cols, int row, float learning_rate) {
    extern __shared__ float _sum[];
    int bid = blockIdx.x;
    float* sp = dZ + cols * bid;
    
    // Initialize shared memory
    _sum[threadIdx.x] = 0.0f;

    // Sum data for each thread
    for (int id = threadIdx.x; id < cols; id += blockDim.x) {
        _sum[threadIdx.x] += sp[id];
    }
    __syncthreads();

    // Reduction using parallel summation
    for (int len = blockDim.x >> 1; len > 0; len >>= 1) {
        if (threadIdx.x < len) {
            _sum[threadIdx.x] += _sum[threadIdx.x + len];
        }
        __syncthreads();
    }

    // Update bias for the first thread in the block
    if (threadIdx.x == 0) {
        b[bid] -= learning_rate * (_sum[0] / cols);
    }
}