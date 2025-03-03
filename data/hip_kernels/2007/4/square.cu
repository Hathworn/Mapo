#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square(float *d_in, float *d_out)
{
int index = threadIdx.x;
float f = d_in[index];
d_out[index] = f * f;
}