#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gLogSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    const int j = blockIdx.x + blockIdx.y * gridDim.x;
    if (j < rows) {
        extern __shared__ float _shared[];
        float* _sum = _shared;

        float* gradRow = grad + j * cols;
        const float* adjRow = adj + j * cols;
        const float* valRow = val + j * cols;

        // Initialize shared memory for sum
        float thread_sum = 0.0;
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            thread_sum += adjRow[tid];
        }
        _sum[threadIdx.x] = thread_sum;
        __syncthreads();

        // Reduce sum across the block
        for(int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
            if(threadIdx.x < stride) {
                _sum[threadIdx.x] += _sum[threadIdx.x + stride];
            }
            __syncthreads();
        }

        // Broadcast the computed sum to all threads
        float sum_val = _sum[0];
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            gradRow[tid] += adjRow[tid] - (expf(valRow[tid]) * sum_val);
        }
    }
}