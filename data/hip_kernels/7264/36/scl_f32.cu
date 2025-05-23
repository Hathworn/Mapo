#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scl_f32 (float* vector, float value, float* output, int len) {
int idx = blockIdx.x * blockDim.x + threadIdx.x;
if (idx < len) {
output[idx] = vector[idx] * value;
}
}