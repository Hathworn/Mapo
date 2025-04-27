#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayScale(uchar3 *input, uchar3 *output) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned char gray = (input[tid].x + input[tid].y + input[tid].z) / 3; // Pre-calculate grayscale value
    output[tid] = make_uchar3(gray, gray, gray); // Direct assignment using make_uchar3
}