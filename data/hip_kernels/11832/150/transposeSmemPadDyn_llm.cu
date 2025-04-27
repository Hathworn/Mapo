#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transposeSmemPadDyn(float *out, float *in, int nx, int ny)
{
    // Dynamically allocated shared memory with padding
    extern __shared__ float tile[];

    // Coordinate in the original matrix calculated by each thread
    unsigned int ix = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int iy = blockDim.y * blockIdx.y + threadIdx.y;
    unsigned int ti = iy * nx + ix; // Linear global memory index

    // Thread index calculations for the transposed block
    unsigned int idx = threadIdx.y * blockDim.x + threadIdx.x;
    unsigned int row_idx = threadIdx.y * (blockDim.x + IPAD) + threadIdx.x;
    unsigned int irow = idx / blockDim.y;
    unsigned int icol = idx % blockDim.y;
    unsigned int col_idx = icol * (blockDim.x + IPAD) + irow;

    // Coordinate in the transposed matrix
    unsigned int t_ix = blockDim.y * blockIdx.y + icol;
    unsigned int t_iy = blockDim.x * blockIdx.x + irow;

    // Linear global memory index for transposed matrix
    unsigned int to = t_iy * ny + t_ix;

    // Transpose with boundary test
    if (ix < nx && iy < ny) 
    {
        // Load data from global memory to shared memory
        tile[row_idx] = in[ti];
    }

    // Thread synchronization
    __syncthreads();

    if (t_ix < ny && t_iy < nx) 
    {
        // Store data to global memory from shared memory
        out[to] = tile[col_idx];
    }
}