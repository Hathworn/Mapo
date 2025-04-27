#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_f32(float* vector, float threshold, float* output, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use conditional move to avoid control divergence
    float value = vector[idx];
    output[idx] = (idx < len) && (value > threshold);
}