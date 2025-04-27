#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    for(int bid = 0; bid < rows; bid += gridDim.x) {
        int j = bid + blockIdx.x;
        if(j < rows) {
            extern __shared__ float _share[];
            float* _sum = _share;

            float* gradRow = grad + j * cols;
            const float* adjRow = adj + j * cols;
            const float* valRow = val + j * cols;
            _sum[threadIdx.x] = 0.0;

            // Optimize reduction using a single loop
            for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
                _sum[threadIdx.x] += valRow[tid] * adjRow[tid];
            }

            __syncthreads();
            
            // Reduce within shared memory
            for(int s = blockDim.x / 2; s > 0; s >>= 1) {
                if(threadIdx.x < s) {
                    _sum[threadIdx.x] += _sum[threadIdx.x + s];
                }
                __syncthreads();
            }

            // Update grad using optimized sum calculation
            for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
                float val = valRow[tid] * (adjRow[tid] - _sum[0]);
                if(val != 0.0) {
                    gradRow[tid] += val;
                }
            }
        }
    }
}