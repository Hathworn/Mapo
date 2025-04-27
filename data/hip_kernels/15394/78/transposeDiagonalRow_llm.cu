#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate linear thread index for grid stride loop
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int gridSize = blockDim.x * gridDim.x;
    
    // Optimize memory access pattern with grid stride loop
    for (unsigned int index = tid; index < nx * ny; index += gridSize) {
        unsigned int ix = index / ny; // Calculate x coordinate
        unsigned int iy = index % ny; // Calculate y coordinate

        if (ix < nx && iy < ny) {
            out[ix * ny + iy] = in[iy * nx + ix];
        }
    }
}