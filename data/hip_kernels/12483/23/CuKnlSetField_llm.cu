#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CuKnlSetField(double xCells, double yCells, double* energy0, double* energy1)
{
    // Calculate unique thread index within grid
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate total number of threads in grid
    const int totalThreads = gridDim.x * blockDim.x;
    // Loop to ensure that every remaining element is processed
    for (int i = gid; i < xCells * yCells; i += totalThreads) {
        energy1[i] = energy0[i];
    }
}