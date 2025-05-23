#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_f32 (float* __restrict__ vector, float value, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < len) {
        vector[idx] = value; // Assign value to vector at idx
    }
}