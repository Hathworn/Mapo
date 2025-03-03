#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void storage_xavier(float *a, int size, float scale, hiprandState *cs) {
int index = blockIdx.x * blockDim.x + threadIdx.x;
if (index < size) {
hiprand_init(1234, index, 0, &cs[index]);
a[index] = (hiprand_uniform(&cs[index]) * 2 - 1) * scale;
}
}