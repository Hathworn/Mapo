#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void EncodeValuesInternal(float value, float& origin, float& dir, float& output, int squaredMode)
{
    if (squaredMode == 1)
    {
        // origin part:      o * (1 - t)^2
        output = (1 - fabs(value)) * (1 - fabs(value)) * origin;
        // direction part:   dir * (-t^2 + 2*t)
        output += (-value * value + 2 * fabs(value)) * dir;
    }
    else
    {
        // origin part:      o * (1 - t)
        output = (1 - fabs(value)) * origin;
        // direction part:   dir * t
        output += fabs(value) * dir;
    }
}

__global__ void EncodeValues(float* values, int numOfValues, float* output, int symbolSize, int squaredMode, float* dirX, float* dirY, float* negDirX, float* negDirY, float* originX, float* originY)
{
    int threadId = blockDim.x * blockIdx.y * gridDim.x // rows preceding current row in grid
                  + blockDim.x * blockIdx.x            // blocks preceding current block
                  + threadIdx.x;

    __shared__ float s_values[2];

    // Load shared values and clamp if squaredMode
    if (threadIdx.x < 2)
    {
        s_values[threadIdx.x] = squaredMode == 1 ? fmaxf(fminf(values[threadIdx.x], 1), -1) : values[threadIdx.x];
    }

    __syncthreads();

    // Return early if the threadId is out of bounds
    if (threadId >= symbolSize)
        return;

    // Optimize direction pointer selection by reducing ternary operations
    float* dirX_local = (s_values[0] > 0) ? dirX : negDirX;
    float* dirY_local = (s_values[1] > 0) ? dirY : negDirY;

    // Encode X dim
    EncodeValuesInternal(s_values[0], originX[threadId], dirX_local[threadId], output[threadId], squaredMode);

    // Encode Y dim if applicable
    if (numOfValues > 1)
    {
        EncodeValuesInternal(s_values[1], originY[threadId], dirY_local[threadId], output[threadId], squaredMode);
    }
}