#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void bcnn_op_cuda_ramp_grad_kernel(int n, float *x, float *dx)
{
int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
if (i < n) {
dx[i] *= ((float)(x[i] > 0) + 0.1f);
}
return;
}