#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float distance(float x1, float x2)
{
return sqrt((x2-x1)*(x2-x1));
}
__device__ float scale(int i, int n)
{
return ((float)i)/(n - 1);
}
__global__ void distanceKernel(float *d_out, float ref, int len)
{
const int i = blockIdx.x * blockDim.x + threadIdx.x;
const float x = scale(i, len);
d_out[i] = distance(x, ref);
printf("i = %2d: dist from %f to %f is %f.\n", i, ref, x, d_out[i]);
}