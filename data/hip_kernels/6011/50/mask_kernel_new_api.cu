#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mask_kernel_new_api(int n, float *x, float mask_num, float *mask, float val)
{
int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
if (i < n && mask[i] == mask_num) x[i] = val;
}