#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixTranspose(float *a, float *b, int nx, int ny) {
    // Calculate the column and row indices using shared memory
    __shared__ float tile[32][32]; // Assuming block size is 32 for better memory coalescing
    
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (ix < nx && iy < ny) {
        // Use local thread indices for improved memory access pattern
        int idx = ix * ny + iy;
        tile[threadIdx.y][threadIdx.x] = a[idx];
    }
    
    __syncthreads(); // Synchronize threads before writing transposed element

    // Transpose elements using shared memory and store them
    ix = blockIdx.y * blockDim.y + threadIdx.x;
    iy = blockIdx.x * blockDim.x + threadIdx.y;

    if (ix < ny && iy < nx) {
        int odx = iy * ny + ix;
        b[odx] = tile[threadIdx.x][threadIdx.y];
    }
}