#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateBiasKernel_relu(float* dZ, float* b, int cols, int row, float learning_rate) {
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    float * _sum = _share;
    float* sp = dZ + cols * bid;
    _sum[threadIdx.x] = 0.0;

    for (int id = threadIdx.x; id < cols; id += blockDim.x) {
        // Utilize warp-level primitives to efficiently reduce the sum
        _sum[threadIdx.x] += sp[id];
    }
    __syncthreads();
    
    // Parallel reduction using warp shuffle
    for (int offset = warpSize / 2; offset > 0; offset /= 2) {
        _sum[threadIdx.x] += __shfl_down_sync(0xFFFFFFFF, _sum[threadIdx.x], offset);
    }

    // Store final result by leader thread of the warp
    if (threadIdx.x % warpSize == 0) {
        atomicAdd(&b[bid], -learning_rate * (_sum[threadIdx.x] / cols));
    }
}