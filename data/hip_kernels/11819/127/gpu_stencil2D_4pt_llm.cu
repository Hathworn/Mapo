#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Shared Memory Dimensions
    int smColDim = HALO*2+blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2+blockDim.x*TILE_SIZE;

    // Global indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Copying to shared memory - Inner part
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO*N + x*TILE_SIZE*N + i*N + y*TILE_SIZE + j + HALO;
            int shMemIndex = HALO*smColDim + threadIdx.x*smColDim*TILE_SIZE + i*smColDim + HALO + threadIdx.y*TILE_SIZE + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Halos - Load borders
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        int smSize = blockDim.x * TILE_SIZE + HALO;
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int topIndex = (blockIdx.x*blockDim.x*TILE_SIZE + i)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                int bottomIndex = (HALO + (blockIdx.x+1)*blockDim.x*TILE_SIZE)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                shSrc[i*smColDim + j] = src[topIndex];
                shSrc[(smSize+i)*smColDim + j] = src[bottomIndex];
            }
        }
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smRowDim - HALO*2; j++) {
                int leftIndex = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + i;
                int rightIndex = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j)*N + ((blockIdx.y+1)*blockDim.y*TILE_SIZE) + HALO + i;
                shSrc[(HALO+j)*smColDim + i] = src[leftIndex];
                shSrc[(HALO+j+1)*smColDim - HALO + i] = src[rightIndex];
            }
        }
    }
    
    __syncthreads();

    // Compute stencil
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO*N+x*TILE_SIZE*N+i*N+y*TILE_SIZE+j+HALO;
            int shMemIndex = HALO*smColDim+threadIdx.x*smColDim*TILE_SIZE+i*smColDim+HALO+threadIdx.y*TILE_SIZE+j;

            // Getting the neighbors
            double north = shSrc[shMemIndex-smColDim];
            double south = shSrc[shMemIndex+smColDim];
            double east  = shSrc[shMemIndex+1];
            double west  = shSrc[shMemIndex-1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
    
    __syncthreads();
}