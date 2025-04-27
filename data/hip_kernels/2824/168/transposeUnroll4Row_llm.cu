#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeUnroll4Row(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x * 4 + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    unsigned int ti = iy * nx + ix; // access in rows

    // Early exit for out of bounds threads
    if (ix + 3 * blockDim.x >= nx || iy >= ny) return;

    // Improved memory access by using registers
    float val0 = in[ti];
    float val1 = in[ti + blockDim.x];
    float val2 = in[ti + 2 * blockDim.x];
    float val3 = in[ti + 3 * blockDim.x];

    unsigned int to = ix * ny + iy; // access in columns

    out[to] = val0;
    out[to + ny * blockDim.x] = val1;
    out[to + ny * 2 * blockDim.x] = val2;
    out[to + ny * 3 * blockDim.x] = val3;
}