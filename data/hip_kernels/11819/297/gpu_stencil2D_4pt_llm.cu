#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // indexes
    int i, j;

    // neighbor's values
    double north, south, east, west;

    // SharedMem Columns Dimension
    int smColDim = HALO*2+blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2+blockDim.x*TILE_SIZE;

    // Compute unique global index for each thread
    int globalBaseIndex = HALO*N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + HALO;
    int shMemBaseIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO + threadIdx.y * TILE_SIZE;

    // Copying to shared memory (Inner part)
    for (i = 0 ; i < TILE_SIZE ; i++) {
        for (j = 0 ; j < TILE_SIZE ; j++) {
            shSrc[shMemBaseIndex + i * smColDim + j] = src[globalBaseIndex + i * N + j];
        }
    }

    // Synchronize after loading inner part
    __syncthreads();

    // Handle halos with branch reduction
    if (threadIdx.x == 0 && threadIdx.y == 0) {

        int indexTopHalo, indexBottomHalo, indexLeftHalo, indexRightHalo;

        // Load top and bottom halo rows in shared memory
        for (i = 0 ; i < HALO ; i++) {
            for (j = 0 ; j < smColDim ; j++) {
                indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                indexBottomHalo = (HALO + (blockIdx.x+1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        // Load left and right halo columns in shared memory
        for (i = 0 ; i < HALO ; i++) {
            for (j = 0 ; j < smRowDim - HALO * 2; j++) {
                indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i;
                indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronize after loading halos
    __syncthreads();

    // Perform stencil computation
    for (i = 0 ; i < TILE_SIZE ; i++) {
        for (j = 0 ; j < TILE_SIZE ; j++) {
            int shMemIndex = shMemBaseIndex + i * smColDim + j;

            // Getting the neighbors
            north = shSrc[shMemIndex - smColDim];
            south = shSrc[shMemIndex + smColDim];
            east  = shSrc[shMemIndex + 1];
            west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalBaseIndex + i * N + j] = (north + south + east + west) / 5.5;
        }
    }

    // Synchronize before exiting the kernel
    __syncthreads();
}