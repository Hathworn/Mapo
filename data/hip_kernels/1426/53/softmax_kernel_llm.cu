#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
  // Using shared memory for intermediate results
  extern __shared__ float shared[];
  float *shared_e = shared;  // For storing intermediate exponentiation results
  
  int i;
  float sum = 0.0f;
  float largest = -INFINITY;
  
  // Find largest element (reduce memory transactions)
  for(i = 0; i < n; ++i){
    float val = input[i*stride];
    largest = (val > largest) ? val : largest;
  }
  
  // Calculate softmax values
  for(i = 0; i < n; ++i){
    float e = expf(input[i*stride] / temp - largest / temp);
    sum += e;
    shared_e[i] = e; // Intermediate result stored in shared memory
  }
  
  // Normalize with the sum
  for(i = 0; i < n; ++i){
    output[i*stride] = shared_e[i] / sum;
  }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
  int id = blockIdx.x * blockDim.x + threadIdx.x;
  if (id >= batch * groups) return;

  int b = id / groups;
  int g = id % groups;

  // Launch device function with shared memory size set
  // Size of shared memory can be optimized based on 'n' and hardware capabilities
  softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}