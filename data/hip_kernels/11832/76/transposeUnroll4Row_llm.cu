#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    // Calculate indexes with less operations
    unsigned int ix = (blockDim.x * blockIdx.x + threadIdx.x) * 4;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    if (ix < nx && iy < ny)
    {
        unsigned int ti = iy * nx + ix; // access in rows
        unsigned int to = ix * ny + iy; // access in columns
        
        // Reuse memory locations to avoid recalculating offsets
        out[to] = in[ti];
        
        ti += blockDim.x;
        to += ny * blockDim.x;
        out[to] = in[ti];
        
        ti += blockDim.x;
        to += ny * blockDim.x;
        out[to] = in[ti];
        
        ti += blockDim.x;
        to += ny * blockDim.x;
        out[to] = in[ti];
    }
}