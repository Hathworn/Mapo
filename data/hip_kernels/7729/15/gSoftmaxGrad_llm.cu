#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    // Use shared memory to reduce global memory access
    extern __shared__ float _share[];
    float* _sum = _share + blockDim.x;
    
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    int stride = gridDim.x * gridDim.y;
    
    for (; j < rows; j += stride) {
        float* gradRow = grad + j * cols;
        const float* adjRow = adj + j * cols;
        const float* valRow = val + j * cols;
        _sum[threadIdx.x] = 0.0f;

        // Sum with stride loop to ensure full warp utilization
        for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            _sum[threadIdx.x] += valRow[tid] * adjRow[tid];
        }

        // Reduce sum within the block
        __syncthreads();
        for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
            if (threadIdx.x < s) {
                _sum[threadIdx.x] += _sum[threadIdx.x + s];
            }
            __syncthreads();
        }

        float summedValue = _sum[0];
        
        // Compute the gradient using the computed sum
        for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            float val = valRow[tid] * (adjRow[tid] - summedValue);
            if (val)
                gradRow[tid] += val;
        }
    }
}