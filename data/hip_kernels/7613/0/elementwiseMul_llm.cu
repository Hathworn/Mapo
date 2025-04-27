#include "hip/hip_runtime.h"
#include "includes.h"
/*
Modified from
https://github.com/zhxfl/CUDA-CNN
*/

__global__ void elementwiseMul(float *x, float *y, float *z, int rows, int cols) {
    int globalIdx = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;

    if (globalIdx < rows * cols) {
        // Perform element-wise multiplication
        z[globalIdx] = x[globalIdx] * y[globalIdx];
    }
}