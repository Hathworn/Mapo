#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void min_output(float *input, float *output, float *indices, long nrows, long ncols)
{
  // output offset:
  long o = threadIdx.x + blockDim.x * blockIdx.x;
  if (o >= nrows) return;

  // input offset:
  long i = o * ncols;

  // move pointers
  input = input + i;

  // compute min using warp parallel reduction
  float min = input[0];
  long argmin = 0;
  for (long stride = 1; stride < ncols; stride *= 2) {
    float val = (i + stride < ncols) ? input[stride] : min;
    long idx = (i + stride < ncols) ? stride : argmin;
    if (val < min) {
      min = val;
      argmin = idx;
    }
  }

  // store
  output[o] = min;
  indices[o] = argmin + 1;
}