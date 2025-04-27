```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
  // Calculate unique index for each thread
  size_t i = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y; 
  if(i >= N) return; // Exit if index exceeds total threads

  // Calculate indices directly to reduce operations
  int out_w = i % (w * stride);
  int out_h = (i / (w * stride)) % (h * stride);
  int out_c = (i / (w * stride * h * stride)) % c;
  int b = i / (w * stride * h * stride * c);

  // Calculate input indices for source matrix
  int in_w = out_w / stride;
  int in_h = out_h / stride;

  int in_index = b * w * h * c + out_c * w * h + in_h * w + in_w; // Simplified in_index computation

  // Conditional operation based on forward variable
  if(forward) {
    out[out_index] += scale * x[in_index]; // Scale and add for forward pass
  } else {
    atomicAdd(x + in_index, scale * out[out_index]); // Use atomicAdd for backward pass
  }
}