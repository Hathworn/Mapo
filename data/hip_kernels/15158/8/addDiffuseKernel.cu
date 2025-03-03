#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addDiffuseKernel(float *data, int x, int y, float pressure)
{
data[NX * x + y] += pressure;
}