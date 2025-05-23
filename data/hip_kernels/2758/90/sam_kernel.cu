#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sam_kernel(float *in_w_h_c, int size, int channel_size, float *scales_c, float *out)
{
const int index = blockIdx.x*blockDim.x + threadIdx.x;
if (index < size) {
out[index] = in_w_h_c[index] * scales_c[index];
}
}