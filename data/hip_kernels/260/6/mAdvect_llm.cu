#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool checkBoundary(int blockIdx, int blockDim, int threadIdx) {
    int x = threadIdx;
    int y = blockIdx;
    return (x == 0 || x == (blockDim - 1) || y == 0 || y == 479);
}

__global__ void mAdvect(float *new_data, float *old_data, float *xv, float *yv, float t_step, float s_stepX, float s_stepY) {
    // Load thread and block indices
    int x = threadIdx.x;
    int y = blockIdx.x;

    // Early exit for boundary conditions
    if (checkBoundary(y, blockDim.x, x)) return;

    // Compute unique linear index
    int Idx = y * blockDim.x + x;

    // Calculate positions 
    float curr_x = static_cast<float>(x);
    float curr_y = static_cast<float>(y);
    float last_x = curr_x - t_step * s_stepX * xv[Idx];
    float last_y = curr_y - t_step * s_stepY * yv[Idx];

    // Clamp positions to avoid out-of-bound access
    last_x = fminf(fmaxf(last_x, 1.5f), 637.5f);
    last_y = fminf(fmaxf(last_y, 1.5f), 477.5f);

    // Bilinear interpolation calculations
    float xDiff = last_x - floorf(last_x);
    float yDiff = last_y - floorf(last_y);
    int LeftTopX = static_cast<int>(last_x);
    int LeftTopY = static_cast<int>(last_y);
    int base = LeftTopY * blockDim.x + LeftTopX; // Pre-calculate base index

    // Efficient memory access with reuse of base index
    new_data[Idx] = (xDiff * yDiff) * old_data[base + blockDim.x + 1]
                  + (xDiff * (1.f - yDiff)) * old_data[base + 1]
                  + ((1.f - xDiff) * yDiff) * old_data[base + blockDim.x]
                  + ((1.f - xDiff) * (1.f - yDiff)) * old_data[base];
}