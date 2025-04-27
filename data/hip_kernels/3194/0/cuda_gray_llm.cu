#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_gray(unsigned char *input, int offset, int streamSize, unsigned char* gray, int size) {

    // Calculate thread index once and use it for both rgb_idx and gray_idx
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gray_idx = (offset / 3) + tid;
    int rgb_idx = offset + (tid * 3);

    if (rgb_idx >= streamSize || gray_idx >= size) {
        return;
    }

    // Optimize memory access by storing input values in registers
    unsigned char r = input[rgb_idx];
    unsigned char g = input[rgb_idx + 1];
    unsigned char b = input[rgb_idx + 2];

    gray[gray_idx] = (gray_value[0] * r) + (gray_value[1] * g) + (gray_value[2] * b);
}