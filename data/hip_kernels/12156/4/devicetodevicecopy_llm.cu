#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devicetodevicecopy(double *dphi, double *dpsix, double *dpsiy, double *mphi, double *mpsix, double *mpsiy, unsigned int nx, unsigned int TileSize)
{
    // Calculate global thread indices
    unsigned int index_x = blockIdx.x * TileSize + threadIdx.x;
    unsigned int index_y = blockIdx.y * TileSize + threadIdx.y;

    // Derive global index to write
    unsigned int indexToWrite = index_y * nx + index_x;

    // Avoid out-of-bound memory access
    if (index_x < nx && index_y * nx < nx * nx) {
        mphi[indexToWrite] = dphi[indexToWrite];
        mpsix[indexToWrite] = dpsix[indexToWrite];
        mpsiy[indexToWrite] = dpsiy[indexToWrite];
    }
}