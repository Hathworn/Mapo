#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Using shared memory for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Compute global indices for threads
    int global_i = HALO*N + blockIdx.x * blockDim.x * TILE_SIZE * N + threadIdx.x * TILE_SIZE * N;
    int global_j = HALO + blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE;

    // Compute shared memory indices
    int sm_i = HALO * blockDim.y * TILE_SIZE + threadIdx.x * blockDim.y * TILE_SIZE;
    int sm_j = HALO + threadIdx.y * TILE_SIZE;

    // Copy inner tiles to shared memory (optimized to eliminate nested loops)
    for (int i = 0; i < TILE_SIZE; i++)
    {
        int offset_i = i * N;
        int sm_offset_i = i * blockDim.y * TILE_SIZE;
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = global_i + offset_i + global_j + j;
            int shMemIndex = sm_i + sm_offset_i + sm_j + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Synchronize to ensure shared memory loads complete
    __syncthreads();

    // Perform stencil operation using shared memory (optimized indexing)
    for (int i = 0; i < TILE_SIZE; i++)
    {
        int sm_offset_i = i * blockDim.y * TILE_SIZE;
        for (int j = 0; j < TILE_SIZE; j++)
        {
            int globalIndex = global_i + i * N + global_j + j;
            int shMemIndex = sm_i + sm_offset_i + sm_j + j;

            // Access neighbor values from shared memory
            double north = shSrc[shMemIndex - blockDim.y * TILE_SIZE];
            double south = shSrc[shMemIndex + blockDim.y * TILE_SIZE];
            double east = shSrc[shMemIndex + 1];
            double west = shSrc[shMemIndex - 1];

            // Write result to global memory
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}