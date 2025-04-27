#include "hip/hip_runtime.h"
#include "includes.h"

static char* program_name;

// Usage
__global__ void jacobiOptimizedOnDevice(float* x_next, float* A, float* x_now, float* b, int Ni, int Nj)
{
  // Use shared memory to reduce global memory access
  __shared__ float s_x_now[1024];  // assuming Nj <= 1024, adjust size as needed
  int idx = blockIdx.x * blockDim.x + threadIdx.x;

  // Load x_now into shared memory
  if (threadIdx.x < Nj) {
    s_x_now[threadIdx.x] = x_now[threadIdx.x];
  }
  __syncthreads();  // synchronize to ensure all threads have loaded x_now
  
  if (idx < Ni)
  {
    float sigma = 0.0;
    int idx_Ai = idx * Nj;

    // Iterate using shared memory for x_now values
    for (int j = 0; j < Nj; j++) {
      if (idx != j) {
        sigma += A[idx_Ai + j] * s_x_now[j];
      }
    }

    // Calculate the next value of x
    x_next[idx] = (b[idx] - sigma) / A[idx_Ai + idx];
  }
}