#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeDiagonalCol(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread (work item) indices
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Utilize transposed grid launch for better memory coalescing
    unsigned int threadIdx = iy * nx + ix;

    // Check boundaries to prevent out-of-bounds access
    if (ix < nx && iy < ny)
    {
        out[iy * nx + ix] = in[ix * ny + iy];
    }
}