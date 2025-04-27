#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_stencil2D_4pt(double * dst, double * src, int M, int N) {
  // Declaring the shared memory array for source
  extern __shared__ double shared_mem[];
  double * shSrc = shared_mem;

  // SharedMem Columns Dimension
  int smColDim = HALO*2 + blockDim.y*TILE_SIZE;
  int smRowDim = HALO*2 + blockDim.x*TILE_SIZE;

  // Calculate global indices for the thread
  int baseGlobalRow = blockIdx.x * blockDim.x * TILE_SIZE + threadIdx.x * TILE_SIZE + HALO;
  int baseGlobalCol = blockIdx.y * blockDim.y * TILE_SIZE + threadIdx.y * TILE_SIZE + HALO;

  // Copying to shared memory: Inner part
  for (int i = 0; i < TILE_SIZE; i++) {
    for (int j = 0; j < TILE_SIZE; j++) {
      int globalIndex = (baseGlobalRow + i) * N + (baseGlobalCol + j);
      int shMemIndex = (HALO + threadIdx.x * TILE_SIZE + i) * smColDim + (HALO + threadIdx.y * TILE_SIZE + j);
      shSrc[shMemIndex] = src[globalIndex];
    }
  }

  // Synchronize to ensure all threads have copied to shared memory
  __syncthreads();

  // Load Halo regions only with a single thread to minimize redundant loads
  if (threadIdx.x == 0 && threadIdx.y == 0) {
    int index;
    
    // Top and Bottom Halos
    for (int i = 0; i < HALO; i++) {
      for (int j = 0; j < smColDim; j++) {
        index = (blockIdx.x * blockDim.x * TILE_SIZE + i) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
        shSrc[i * smColDim + j] = src[index];
        index = (HALO + (blockIdx.x + 1) * blockDim.x * TILE_SIZE) * N + blockIdx.y * blockDim.y * TILE_SIZE + j;
        shSrc[(HALO + blockDim.x * TILE_SIZE + i) * smColDim + j] = src[index];
      }
    }

    // Left and Right Halos
    for (int i = 0; i < HALO; i++) {
      for (int j = 0; j < smRowDim - HALO*2; j++) {
        index = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + blockIdx.y * blockDim.y * TILE_SIZE + i;
        shSrc[(HALO + j) * smColDim + i] = src[index];
        index = (HALO + blockIdx.x * blockDim.x * TILE_SIZE + j) * N + ((blockIdx.y + 1) * blockDim.y * TILE_SIZE) + HALO + i;
        shSrc[(HALO + j + 1) * smColDim - HALO + i] = src[index];
      }
    }
  }

  // Synchronize to ensure all halo regions are loaded
  __syncthreads();

  // Stencil operation
  for (int i = 0; i < TILE_SIZE; i++) {
    for (int j = 0; j < TILE_SIZE; j++) {
      int globalIndex = (baseGlobalRow + i) * N + (baseGlobalCol + j);
      int shMemIndex = (HALO + threadIdx.x * TILE_SIZE + i) * smColDim + (HALO + threadIdx.y * TILE_SIZE + j);

      // Getting the neighbors
      double north = shSrc[shMemIndex - smColDim];
      double south = shSrc[shMemIndex + smColDim];
      double east = shSrc[shMemIndex + 1];
      double west = shSrc[shMemIndex - 1];

      // Real Stencil operation
      dst[globalIndex] = (north + south + east + west) / 5.5;
    }
  }
}