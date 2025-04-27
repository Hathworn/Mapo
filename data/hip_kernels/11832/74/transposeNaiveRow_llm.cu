#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Calculate global thread position
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure indices are within bounds using shared memory (coalescing memory access)
    __shared__ float tile[32][33]; // Adjust tile size to handle bank conflicts

    if (ix < nx && iy < ny)
    {
        // Load data to shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads();

        // Write data to output in transposed order
        out[ix * ny + iy] = tile[threadIdx.y][threadIdx.x];
    }
}