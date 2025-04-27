#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize all threads in the block to set value instead of checking threadIdx.x
__global__ void setValue(float *data, int idx, float value) {
    if (blockIdx.x * blockDim.x + threadIdx.x == idx) {
        data[idx] = value;
    }
}