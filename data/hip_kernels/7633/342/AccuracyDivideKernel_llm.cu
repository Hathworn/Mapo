#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AccuracyDivideKernel(const int N, float* accuracy) {
  // Use local variable to reduce memory access latency
  float acc_local = *accuracy;
  acc_local /= N;
  *accuracy = acc_local;
}