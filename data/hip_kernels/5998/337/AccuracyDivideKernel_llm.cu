#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use atomic operation to safely perform division in parallel
  atomicExch(accuracy, *accuracy / N);
}