#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void histColorsKernel(float* histColors, hiprandState* states) {
int bin = blockIdx.x * blockDim.x + threadIdx.x;

histColors[3 * bin + 0] = hiprand_uniform(&states[bin]);
histColors[3 * bin + 1] = hiprand_uniform(&states[bin]);
histColors[3 * bin + 2] = hiprand_uniform(&states[bin]);
}