#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory to reduce global memory accesses
    __shared__ float tile[32][33]; // Avoid bank conflicts

    if (ix < nx && iy < ny)
    {
        // Read the matrix tile into shared memory
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
        __syncthreads();

        // Write the transposed matrix tile to global memory
        out[ix * ny + iy] = tile[threadIdx.y][threadIdx.x];
    }
}
```
