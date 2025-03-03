#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_multiply_inplace(const hipDoubleComplex* A, hipDoubleComplex* B, const int size)
{
int tid = blockIdx.x * blockDim.x + threadIdx.x;
if(tid < size) {
B[tid] = hipCmul(A[tid], B[tid]);
}
}