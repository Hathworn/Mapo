#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addScalarInArrayInPlace(float* in, float* add, float scale, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    float add_scaled = add[0] * scale; // Precompute scaled addition factor
    for (; tid < size; tid += stride) {
        // Remove redundant boundary check within loop
        in[tid] += add_scaled;
    }
}