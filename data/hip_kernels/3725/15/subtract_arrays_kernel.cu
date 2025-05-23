#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void subtract_arrays_kernel(int32_t* __restrict a, const int32_t* __restrict b, const int64_t array_count) {
for (int i = threadIdx.x + (blockIdx.x * blockDim.x); i < array_count; i += blockDim.x * gridDim.x) {
a[i] -= b[i];
}
}