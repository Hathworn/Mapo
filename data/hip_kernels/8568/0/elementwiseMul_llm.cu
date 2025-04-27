#include "hip/hip_runtime.h"
#include "includes.h"
/*
Modified from
https://github.com/zhxfl/CUDA-CNN
*/

__global__ void elementwiseMul(float *x, float *y, float *z, int rows, int cols) {
    // Calculate linear index
    int index = blockIdx.y * blockDim.y * cols + blockIdx.x * blockDim.x + threadIdx.y * cols + threadIdx.x;

    // Check boundary condition
    if (index < rows * cols) {
        // Perform element-wise multiplication
        z[index] = x[index] * y[index];
    }
}