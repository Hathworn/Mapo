#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void colorsKernel(float* colors, hiprandState* states) {
int id = blockIdx.x * blockDim.x + threadIdx.x;

colors[3 * id + 0] = hiprand_uniform(&states[id]);
colors[3 * id + 1] = hiprand_uniform(&states[id]);
colors[3 * id + 2] = hiprand_uniform(&states[id]);
}