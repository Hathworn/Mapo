#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gLogSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    if(j < rows) {
        extern __shared__ float _sharedMem[];
        float* _sum = _sharedMem;

        float* gradRow = grad + j * cols;
        const float* adjRow = adj + j * cols;
        const float* valRow = val + j * cols;

        // Initialize shared memory
        float threadSum = 0.0;
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            threadSum += adjRow[tid];
        }
        _sum[threadIdx.x] = threadSum;

        // Reduce to get the sum across the block
        __syncthreads();
        for(int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if(threadIdx.x < offset) {
                _sum[threadIdx.x] += _sum[threadIdx.x + offset];
            }
            __syncthreads();
        }

        // Update gradients
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            gradRow[tid] += adjRow[tid] - (expf(valRow[tid]) * _sum[0]);
        }
    }
}