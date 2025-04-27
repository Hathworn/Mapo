#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void sigmoid_float(int n, int idx, float *dy, int incy, float *result) {
  // Calculate unique global index
  int i = blockIdx.x * blockDim.x + threadIdx.x;
  
  // Use stride pattern for enhanced parallelism
  int stride = blockDim.x * gridDim.x;
  
  for (; i < n; i += stride) {
    // Check condition to perform the operation
    if (i >= idx && i % incy == 0) {
      result[i] = 1.0f / (1.0f + expf(-dy[i]));
    }
  }
}