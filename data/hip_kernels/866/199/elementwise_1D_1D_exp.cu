#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
int tid = blockIdx.x * blockDim.x + threadIdx.x;
int stride = gridDim.x * blockDim.x;
for (; tid < size; tid += stride)
if (tid < size) out[tid] = exp(in[tid]);
}