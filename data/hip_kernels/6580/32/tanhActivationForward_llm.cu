#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void tanhActivationForward(float* __restrict__ Z, float* __restrict__ A, int Z_x_dim, int Z_y_dim) {
  
  int index = blockIdx.x * blockDim.x + threadIdx.x;
  int total_elements = Z_x_dim * Z_y_dim;
  
  // Use a loop to allow threads to handle multiple elements
  for (int i = index; i < total_elements; i += blockDim.x * gridDim.x) {
    A[i] = __builtin_tanhf(Z[i]); // Uses __builtin_tanhf for better performance
  }
}