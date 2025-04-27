#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N)
{
    // Declare shared memory array for source
    extern __shared__ double shared_mem[];
    double * shSrc = shared_mem;

    // Calculate common indices once outside loops for efficiency
    int smColDim = HALO*2 + blockDim.y*TILE_SIZE;
    int smRowDim = HALO*2 + blockDim.x*TILE_SIZE;

    // Local thread indices
    int local_i = threadIdx.x;
    int local_j = threadIdx.y;

    // Compute global base index for this thread
    int base_global_index = HALO*N + blockIdx.x*blockDim.x*TILE_SIZE*N + blockIdx.y*blockDim.y*TILE_SIZE + local_i*TILE_SIZE*N + local_j*TILE_SIZE + HALO;
    int base_shMemIndex = HALO*smColDim + local_i*smColDim*TILE_SIZE + HALO + local_j*TILE_SIZE;

    // Copy input to shared memory (inner part)
    for (int i = 0; i < TILE_SIZE; i++) {
        #pragma unroll // Enable loop unrolling
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = base_global_index + i*N + j;
            int shMemIndex = base_shMemIndex + i*smColDim + j;
            shSrc[shMemIndex] = src[globalIndex];
        }
    }

    // Handle halos
    if (local_i == 0 && local_j == 0)
    {
        int idx_top, idx_bottom, idx_left, idx_right;
        // Handle top and bottom halos
        for (int i = 0; i < HALO; i++) {
            #pragma unroll
            for (int j = 0; j < smColDim; j++) {
                idx_top = (blockIdx.x*blockDim.x*TILE_SIZE+i)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                idx_bottom = (HALO + (blockIdx.x+1)*blockDim.x*TILE_SIZE)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + j;
                shSrc[i*smColDim + j] = src[idx_top];
                shSrc[(HALO+blockDim.x*TILE_SIZE+i)*smColDim + j] = src[idx_bottom];
            }
        }
        // Handle left and right halos
        for (int i = 0; i < HALO; i++) {
            #pragma unroll
            for (int j = 0; j < smRowDim-HALO*2; j++) {
                idx_left = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j)*N + (blockIdx.y*blockDim.y*TILE_SIZE) + i;
                idx_right = (HALO + blockIdx.x*blockDim.x*TILE_SIZE + j)*N + ((blockIdx.y+1)*blockDim.y*TILE_SIZE) + HALO + i;
                shSrc[(HALO+j)*smColDim + i] = src[idx_left];
                shSrc[(HALO+j+1)*smColDim - HALO + i] = src[idx_right];
            }
        }
    }

    __syncthreads();

    // Apply stencil operation
    for (int i = 0; i < TILE_SIZE; i++) {
        #pragma unroll
        for (int j = 0; j < TILE_SIZE; j++) {
            int globalIndex = base_global_index + i*N + j;
            int shMemIndex = base_shMemIndex + i*smColDim + j;

            // Read neighbor values
            double north = shSrc[shMemIndex - smColDim];
            double south = shSrc[shMemIndex + smColDim];
            double east  = shSrc[shMemIndex + 1];
            double west  = shSrc[shMemIndex - 1];

            // Perform stencil operation
            dst[globalIndex] = (north + south + east + west) / 5.5;
        }
    }
}