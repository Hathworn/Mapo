#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void randKernel(float* out, hiprandState* states, float min, float scale) {
int id  = blockIdx.x * blockDim.x + threadIdx.x;
out[id] = hiprand_uniform(&states[id]) * scale + min;
}