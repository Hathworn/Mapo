#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Brent_Kung_scan_kernel(float *X, float *Y, int InputSize)
{
    __shared__ float XY[SECTION_SIZE];
    int i = 2 * blockIdx.x * blockDim.x + threadIdx.x;

    // Load input to shared memory with bounds checks
    if (i < InputSize) XY[threadIdx.x] = X[i];
    else XY[threadIdx.x] = 0;
    if (i + blockDim.x < InputSize) XY[threadIdx.x + blockDim.x] = X[i + blockDim.x];
    else XY[threadIdx.x + blockDim.x] = 0;

    // Up-sweep (reduction) phase
    for (unsigned int stride = 1; stride <= blockDim.x; stride *= 2) {
        __syncthreads();
        int index = (threadIdx.x + 1) * 2 * stride - 1;
        if (index < SECTION_SIZE) {
            XY[index] += XY[index - stride];
        }
    }

    // Down-sweep phase
    for (int stride = SECTION_SIZE / 4; stride > 0; stride /= 2) {
        __syncthreads();
        int index = (threadIdx.x + 1) * stride * 2 - 1;
        if (index + stride < SECTION_SIZE) {
            XY[index + stride] += XY[index];
        }
    }

    __syncthreads();

    // Write the results back to global memory with bounds checks
    if (i < InputSize) Y[i] = XY[threadIdx.x];
    if (i + blockDim.x < InputSize) Y[i + blockDim.x] = XY[threadIdx.x + blockDim.x];
}