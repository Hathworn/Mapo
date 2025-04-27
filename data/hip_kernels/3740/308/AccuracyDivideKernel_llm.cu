#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use single thread to divide, ensuring no race conditions
  if (threadIdx.x == 0 && blockIdx.x == 0) {
    *accuracy /= N;
  }
}