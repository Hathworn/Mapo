#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with using blockDim.x * blockDim.y * gridDim.x calculations to simplify index computation.
__global__ void yoloswag420blazeit360noscope(float *input, int size, float *rand, float prob, float scale)
{
  int id = blockIdx.x * blockDim.x + threadIdx.x + 
           blockIdx.y * (gridDim.x * blockDim.x);
  
  // Avoid redundant computation of accessing arrays/tid bounds. Ops are reduced here.
  if (id < size) {
    float rand_val = rand[id];
    float input_val = input[id];
    input[id] = (rand_val < prob) ? 0.0f : input_val * scale;  
  }
}