#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use atomic operation for division to ensure thread safety
  atomicExch(accuracy, *accuracy / N);
}