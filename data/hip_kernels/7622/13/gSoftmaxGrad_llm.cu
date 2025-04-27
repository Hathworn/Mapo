#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
    // Calculate row based on grid and block index
    int j = blockIdx.x + blockIdx.y * gridDim.x;
    if(j < rows) {
        extern __shared__ float _share[];
        float* _sum = _share;

        float* gradRow = grad + j * cols;
        const float* adjRow = adj + j * cols;
        const float* valRow = val + j * cols;

        // Initialize shared memory for summing
        float tempSum = 0.0f;
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            tempSum += valRow[tid] * adjRow[tid];
        }

        _sum[threadIdx.x] = tempSum;
        __syncthreads();

        // Reduce sum in shared memory
        for(int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if(threadIdx.x < offset) {
                _sum[threadIdx.x] += _sum[threadIdx.x + offset];
            }
            __syncthreads();
        }

        // Calculate gradients
        float finalSum = _sum[0];
        for(int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
            float val = valRow[tid] * (adjRow[tid] - finalSum);
            if(val) {
                gradRow[tid] += val;
            }
        }
    }
}