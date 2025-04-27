#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableLogit(float x) {
  if (x >= 0) {
    float z = expf(-x);
    return 1.0 / (1.0 + z);
  } else {
    float z = expf(x);
    return z / (1.0 + z);
  }
}

__global__ void gHighwayBackward(
  float* out1, 
  float* out2, 
  float* outt, 
  const float* in1, 
  const float* in2, 
  const float* t, 
  const float* adj, 
  size_t length) {
    
  int index = blockDim.x * blockIdx.x + threadIdx.x;
  int stride = blockDim.x * gridDim.x;

  // Use strided loop for memory coalescing and better occupancy
  for (int i = index; i < length; i += stride) {
    float sigma = stableLogit(t[i]);
    float adjVal = adj[i];
    out1[i] = sigma * adjVal;
    out2[i] = (1.f - sigma) * adjVal; 
    outt[i] = sigma * (1.f - sigma) * (in1[i] - in2[i]) * adjVal;
  }
}