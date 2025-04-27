#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateBiasKernel(float* dZ, float* b, int cols, int row, float learning_rate){
    int bid = blockIdx.x;
    extern __shared__ float _share[];
    float* _sum = _share;
    float* sp = dZ + cols * bid;
    _sum[threadIdx.x] = 0.0;
    
    // Use unrolling to speed up the reduction
    for(int id = threadIdx.x; id < cols; id += blockDim.x){
        _sum[threadIdx.x] += sp[id];
    }
    __syncthreads();

    // Optimized reduction using shared memory
    for(int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if(threadIdx.x < offset) {
            _sum[threadIdx.x] += _sum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    if(threadIdx.x == 0) {
        b[bid] -= learning_rate * (_sum[0] / cols);
    }
}