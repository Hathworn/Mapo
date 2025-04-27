#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Calculate the thread index
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  
  // Use one thread to perform the division
  if (index == 0) {
    *accuracy /= N;
  }
}