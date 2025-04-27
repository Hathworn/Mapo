#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef _WIN32
#  define WINDOWS_LEAN_AND_MEAN
#  define NOMINMAX
#  include <windows.h>
#endif

#if defined (__APPLE__) || defined(MACOSX)
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
#ifndef glutCloseFunc
#define glutCloseFunc glutWMCloseFunc
#endif
#else
#endif

__device__ int CountAliveCells(int *i_cells, int idx, int width, int height)
{
    int alive = 0;
    int posY = idx / width;
    int posX = idx % width;

    for (int i = -1; i <= 1; i++)
    {
        for (int j = -1; j <= 1; j++)
        {
            int currPosX = (posX + i + width) % width; // Avoid negative values
            int currPosY = (posY + j + height) % height;

            int neigh = currPosY * width + currPosX;

            if (i == 0 && j == 0)
                continue;
            if (i_cells[neigh] == 1)
                alive++;
        }
    }
    return alive;
}

__global__ void CalcNextGeneration(int *i_cells, int *o_cells, int width, int height)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx >= width * height)
        return;

    int neighCount = CountAliveCells(i_cells, idx, width, height);

    // Optimize branching logic by combining into a single line
    o_cells[idx] = (neighCount == 3 || (neighCount == 2 && i_cells[idx] == 1));

    __syncthreads(); // Ensure all threads reach this point
}