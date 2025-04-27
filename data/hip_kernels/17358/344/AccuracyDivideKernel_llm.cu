#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use atomic operation for thread-safe division
  atomicExch(accuracy, *accuracy / N);
}