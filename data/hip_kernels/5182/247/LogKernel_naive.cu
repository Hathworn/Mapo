#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void LogKernel_naive(const float * A , int Acount, int Acols, float * out0 , int out0count)
{
int id = blockDim.x * blockIdx.y * gridDim.x	+ blockDim.x * blockIdx.x	+ threadIdx.x;
if(id < out0count)
{
out0[id] = log(A[id]);
}
}