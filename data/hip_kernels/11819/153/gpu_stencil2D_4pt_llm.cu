#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double *dst, double *src, int M, int N) {
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double *shSrc = shared_mem;

    // Calculate indices and shared memory dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;
    int local_i = threadIdx.x * TILE_SIZE;
    int local_j = threadIdx.y * TILE_SIZE;
    
    // Calculate global and shared memory indices
    int baseGlobalIndex = HALO * N + blockIdx.x * blockDim.x * TILE_SIZE * N + 
                          blockIdx.y * blockDim.y * TILE_SIZE + HALO;
    int baseShMemIndex = HALO * smColDim + threadIdx.x * smColDim * TILE_SIZE + HALO;

    // Copy inner part to shared memory
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = baseGlobalIndex + local_i * N + local_j + i * N + j;
            int shMemIndex = baseShMemIndex + local_i * smColDim + local_j + i * smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }
    
    // Synchronize after loading inner region
    __syncthreads();

    // Load halo regions
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smColDim; ++j) {
                int indexTopHalo = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                int indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }

        for (int i = 0; i < HALO; ++i) {
            for (int j = 0; j < smRowDim - HALO * 2; ++j) {
                int indexLeftHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + (blockIdx.y * blockDim.y * TILE_SIZE) + i;
                int indexRightHalo = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }
    
    // Synchronize after loading halo regions
    __syncthreads();

    // Compute stencil
    for (int i = 0; i < TILE_SIZE; ++i) {
        for (int j = 0; j < TILE_SIZE; ++j) {
            int globalIndex = baseGlobalIndex + local_i * N + local_j + i * N + j;
            int shMemIndex = baseShMemIndex + local_i * smColDim + local_j + i * smColDim + j;
            
            // Get the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
    
    // Final synchronization
    __syncthreads();
}