#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Calculate the index based on thread and block
  int index = blockIdx.x * blockDim.x + threadIdx.x;

  // Perform division only if index is valid to handle parallel execution
  if (index < N) {
    accuracy[index] /= N;
  }
}