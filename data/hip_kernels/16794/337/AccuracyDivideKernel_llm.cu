#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use shared memory for faster access
  __shared__ float sharedAccuracy;
  if (threadIdx.x == 0) {
    sharedAccuracy = *accuracy;
  }
  __syncthreads();
  
  // Perform division using shared memory
  sharedAccuracy /= N;
  __syncthreads();
  
  if (threadIdx.x == 0) {
    *accuracy = sharedAccuracy;
  }
}