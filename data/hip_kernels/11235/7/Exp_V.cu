#include "hip/hip_runtime.h"
#include "includes.h"






















__device__ hiprandState randomStates[256];



__global__ void Exp_V(const float* a, float* out, const int n)
{
int blockId = blockIdx.y * gridDim.x + blockIdx.x;
int i = blockId * blockDim.x + threadIdx.x;

if (i < n)
{
out[i] = __expf(a[i]);
}
}