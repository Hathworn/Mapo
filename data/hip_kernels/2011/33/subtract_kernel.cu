#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

if (i >= c_Size.x || j >= c_Size.y || k >= c_Size.z)
return;

long int id = (k * c_Size.y + j) * c_Size.x + i;

out[id] = in1[id] - in2[id];
}