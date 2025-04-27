#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swan_fast_fill_word(uint *ptr, int len) {
// Calculate global index and step size
int idx = threadIdx.x + blockDim.x * blockIdx.x;
int stride = gridDim.x * blockDim.x;

// Loop to fill memory in increments of stride
for (; idx < len; idx += stride) {
    ptr[idx] = 0;
}
}