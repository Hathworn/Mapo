#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void misaligned_write_test(float* a, float* b, float *c, int size, int offset)
{
int gid = blockIdx.x * blockDim.x + threadIdx.x;
int k = gid + offset;

if (k < size)
c[k] = a[gid] + b[gid];
}