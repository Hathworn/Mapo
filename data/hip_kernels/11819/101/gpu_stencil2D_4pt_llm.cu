#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declaring the shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // SharedMem Dimensions
    int smColDim = HALO * 2 + blockDim.y * TILE_SIZE;
    int smRowDim = HALO * 2 + blockDim.x * TILE_SIZE;

    // Compute starting indices in global memory
    int base_index_x = blockIdx.x * blockDim.x * TILE_SIZE;
    int base_index_y = blockIdx.y * blockDim.y * TILE_SIZE;
    int thread_base_x = threadIdx.x * TILE_SIZE;
    int thread_base_y = threadIdx.y * TILE_SIZE;
    
    // Copying Inner part to shared memory
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO * N + base_index_x * N + thread_base_x * N + i * N + base_index_y + thread_base_y + j + HALO;
            int shMemIndex = HALO * smColDim + thread_base_x * smColDim + i * smColDim + HALO + thread_base_y + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to ensure all threads have copied their elements
    __syncthreads();

    // Thread 0 handles halo region loading
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        // Load top and bottom halos
        for (int i = 0; i < HALO; i++) {
            for (int j = 0; j < smColDim; j++) {
                int indexTopHalo = base_index_x * N + i * N + base_index_y + j;
                int indexBottomHalo = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + base_index_y + j;
                shSrc[i * smColDim + j] = src[indexTopHalo];
                shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[indexBottomHalo];
            }
        }
        // Load left and right halos
        for (int j = 0; j < smRowDim - HALO * 2; j++) {
            for (int i = 0; i < HALO; i++) {
                int indexLeftHalo = (HALO + base_index_x + j) * N + base_index_y + i;
                int indexRightHalo = (HALO + base_index_x + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
                shSrc[(HALO + j) * smColDim + i] = src[indexLeftHalo];
                shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[indexRightHalo];
            }
        }
    }

    // Synchronize to ensure halo regions are loaded
    __syncthreads();

    // Compute stencil
    for (int i = 0; i < TILE_SIZE; i++) {
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = HALO * N + base_index_x * N + thread_base_x * N + i * N + base_index_y + thread_base_y + j + HALO;
            int shMemIndex = HALO * smColDim + thread_base_x * smColDim + i * smColDim + HALO + thread_base_y + j;

            // Getting the neighbors
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Real Stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }

    // Synchronize before finishing kernel to ensure all computations are done
    __syncthreads();
}