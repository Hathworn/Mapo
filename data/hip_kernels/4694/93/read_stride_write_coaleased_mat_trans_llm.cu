#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void read_stride_write_coaleased_mat_trans(float* input, float* output, const int nx, const int ny)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny)
    {
        // Utilize shared memory for coalesced memory access
        __shared__ float tile[BLOCK_SIZE][BLOCK_SIZE + 1];
        
        // Read into shared memory in a coalesced manner
        tile[threadIdx.y][threadIdx.x] = input[ix * ny + iy];
        
        __syncthreads();
        
        // Write from shared memory to global memory in a coalesced manner
        output[iy * nx + ix] = tile[threadIdx.y][threadIdx.x];
    }
}