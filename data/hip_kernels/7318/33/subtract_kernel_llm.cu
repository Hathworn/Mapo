#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
  // Calculate the unique global thread index corresponding to the 3D grid.
  unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
  unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
  unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

  // Calculate a linear index id.
  long int id = (k * c_Size.y + j) * c_Size.x + i;

  // Avoid redundant computation with early return
  // Check array bounds before accessing memory.
  if (i < c_Size.x && j < c_Size.y && k < c_Size.z) {
    out[id] = in1[id] - in2[id];
  }
}