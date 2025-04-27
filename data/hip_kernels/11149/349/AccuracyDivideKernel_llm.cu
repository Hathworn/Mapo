#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Using a single thread to perform the division for simplicity and efficiency
  if (threadIdx.x == 0 && blockIdx.x == 0) {
    *accuracy /= N;
  }
}