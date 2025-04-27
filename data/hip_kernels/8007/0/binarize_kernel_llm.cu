#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
  // Calculate unique thread index
  int i = blockIdx.x * blockDim.x + threadIdx.x;

  // Process the array with a stride of total number of threads
  for (; i < n; i += blockDim.x * gridDim.x) {
    binary[i] = (x[i] >= 0) ? 1 : -1;
  }
}