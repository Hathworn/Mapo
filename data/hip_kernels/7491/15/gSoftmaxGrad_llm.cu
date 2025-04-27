#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gSoftmaxGrad(float* grad, const float* adj, const float* val, const int rows, const int cols) {
  // Calculate row index using block and grid dimensions
  int j = blockIdx.x + blockIdx.x + gridDim.x;
  if (j < rows) {
    extern __shared__ float _share[];
    float* _sum = _share;
    
    float* gradRow = grad + j * cols;
    const float* adjRow = adj + j * cols;
    const float* valRow = val + j * cols;
    
    // Use local variable to accumulate sum
    float localSum = 0.0f;
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
      localSum += valRow[tid] * adjRow[tid];
    }
    
    _sum[threadIdx.x] = localSum;
    __syncthreads();
    
    // Use reduction to calculate sum
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
      if (threadIdx.x < stride) {
        _sum[threadIdx.x] += _sum[threadIdx.x + stride];
      }
      __syncthreads();
    }
    
    float totalSum = _sum[0];
    
    // Calculate grad values
    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) {
      float val = valRow[tid] * (adjRow[tid] - totalSum);
      if (val != 0.0f) {
        gradRow[tid] += val;
      }
    }
  }
}