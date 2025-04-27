#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuMultOpti( int *a, int *b, int *c, int wA, int wB, int hA)
{
#define blockTile 16
/* Blocksize is 16x16 */
/* Allocate shared memory */
__shared__ int aBlock[blockTile][blockTile];
__shared__ int bBlock[blockTile][blockTile];

/* Calculate global index X, Y */
int gidx = blockDim.x * blockIdx.x + threadIdx.x;  // column
int gidy = blockDim.y * blockIdx.y + threadIdx.y;  // row

/* Initialize sum */
int sum = 0;
/* Loop over the tiles */
for (int m = 0; m < (wA - 1) / blockTile + 1; ++m) {
    /* Collaborative loading of a and b into shared memory */
    if (m * blockTile + threadIdx.x < wA && gidy < hA) {
        aBlock[threadIdx.y][threadIdx.x] = a[gidy * wA + m * blockTile + threadIdx.x];
    } else {
        aBlock[threadIdx.y][threadIdx.x] = 0;
    }

    if (m * blockTile + threadIdx.y < wA && gidx < wB) {
        bBlock[threadIdx.y][threadIdx.x] = b[(m * blockTile + threadIdx.y) * wB + gidx];
    } else {
        bBlock[threadIdx.y][threadIdx.x] = 0;
    }

    /* Make sure all threads have cached the memory */
    __syncthreads();

    for (int k = 0; k < blockTile; ++k) {
        sum += aBlock[threadIdx.y][k] * bBlock[k][threadIdx.x];
    }

    /* Synchronize to make sure all threads are done computing */
    __syncthreads();
}

/* Write result back to global memory */
if (gidx < wB && gidy < hA) {
    c[gidy * wB + gidx] = sum;
}
}