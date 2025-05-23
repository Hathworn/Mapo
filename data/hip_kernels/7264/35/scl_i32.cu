#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scl_i32 (int* vector, int value, int* output, int len) {
int idx = blockIdx.x * blockDim.x + threadIdx.x;
if (idx < len) {
output[idx] = vector[idx] * value;
}
}