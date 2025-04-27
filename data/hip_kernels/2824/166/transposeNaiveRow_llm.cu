#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeNaiveRow(float *out, float *in, const int nx, const int ny)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[32][32 + 1]; // +1 to avoid bank conflicts

    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    
    if (ix < nx && iy < ny)
    {
        tile[threadIdx.y][threadIdx.x] = in[iy * nx + ix];
    }
    
    __syncthreads();
    
    ix = blockDim.y * blockIdx.y + threadIdx.x; // Transpose indices
    iy = blockDim.x * blockIdx.x + threadIdx.y;
    
    if (ix < ny && iy < nx)
    {
        out[iy * ny + ix] = tile[threadIdx.x][threadIdx.y];
    }
}