#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 256  // Define optimal threads per block

__device__ void softmax_device(float *input, int n, float temp, int stride, float *output)
{
  extern __shared__ float shared_mem[];  // Use shared memory for more efficient reduction
  float* shared_largest = shared_mem;
  float* shared_exp_sum = shared_mem + blockDim.x;
  
  int i = threadIdx.x;
  float sum = 0;
  float largest = -INFINITY;

  // Find the largest value for numerical stability
  if (i < n) {
    int idx = i * stride;
    float val = input[idx];
    atomicMax(&shared_largest[0], val);  // Use atomicMax for reduction
  }
  __syncthreads();
  largest = shared_largest[0];

  // Compute exponentials
  if (i < n) {
    int idx = i * stride;
    float e = expf((input[idx] - largest)/temp);
    output[idx] = e;
    atomicAdd(&shared_exp_sum[0], e);  // Use atomicAdd for sum reduction
  }
  __syncthreads();
  sum = shared_exp_sum[0];

  // Normalize outputs
  if (i < n) {
    int idx = i * stride;
    output[idx] /= sum;
  }
}

__global__ void softmax_kernel(float *input, int n, int batch, int batch_offset, int groups, int group_offset, int stride, float temp, float *output)
{
  int id = blockIdx.x * blockDim.x + threadIdx.x;
  if (id >= batch * groups) return;
  int b = id / groups;
  int g = id % groups;
  
  softmax_device(input + b * batch_offset + g * group_offset, n, temp, stride, output + b * batch_offset + g * group_offset);
}