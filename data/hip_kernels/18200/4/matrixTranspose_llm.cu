#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixTranspose(double *a, double *c, int cr, int cc) {

    int x = blockIdx.x * blockDim.x + threadIdx.x; // col
    int y = blockIdx.y * blockDim.y + threadIdx.y; // row

    if(x < cc && y < cr) {
        // Use shared memory to optimize memory access
        __shared__ double tile[32][32 + 1]; // Assuming block size 32x32; add padding to avoid bank conflicts

        tile[threadIdx.y][threadIdx.x] = a[y * cc + x];

        __syncthreads();

        c[x * cr + y] = tile[threadIdx.x][threadIdx.y]; // Transposed write with coalesced access
    }
}