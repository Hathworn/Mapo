#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Calculate the starting point index for the row and column
    unsigned int ix = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds for the matrix dimensions
    if (ix + 3 * blockDim.x < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // access input in rows
        unsigned int to = ix * ny + iy; // access output in columns
        
        // Perform unrolled transpose operation
        float val1 = in[ti]; 
        float val2 = in[ti + blockDim.x];
        float val3 = in[ti + 2 * blockDim.x];
        float val4 = in[ti + 3 * blockDim.x];
        
        out[to] = val1;
        out[to + ny * blockDim.x] = val2;
        out[to + ny * 2 * blockDim.x] = val3;
        out[to + ny * 3 * blockDim.x] = val4;
    }
}