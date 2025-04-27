#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate transposed index using cooperative thread array dimension
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within bounds and perform transposition
    if (ix < nx && iy < ny)
    {
        // Optimize by reducing global memory accesses
        unsigned int inputIndex = iy * nx + ix;
        unsigned int outputIndex = ix * ny + iy;
        out[outputIndex] = in[inputIndex];
    }
}