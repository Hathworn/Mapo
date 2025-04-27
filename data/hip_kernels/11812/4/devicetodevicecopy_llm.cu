#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void devicetodevicecopy(double *dphi, double *dpsix, double *dpsiy, double *mphi, double *mpsix, double *mpsiy, unsigned int nx, unsigned int TileSize)
{
    // Use shared memory for optimized memory access
    __shared__ double shared_dphi[1024];
    __shared__ double shared_dpsix[1024];
    __shared__ double shared_dpsiy[1024];
  
    unsigned int bx = blockIdx.x;
    unsigned int by = blockIdx.y;
  
    unsigned int tx = threadIdx.x;
    unsigned int ty = threadIdx.y;
  
    unsigned int index_x = bx * TileSize + tx;
    unsigned int index_y = by * TileSize + ty;
    unsigned int indexInBlock = ty * TileSize + tx;
  
    unsigned int indexToWrite = index_y * nx + index_x;

    // Load data into shared memory
    shared_dphi[indexInBlock] = dphi[indexToWrite];
    shared_dpsix[indexInBlock] = dpsix[indexToWrite];
    shared_dpsiy[indexInBlock] = dpsiy[indexToWrite];

    __syncthreads(); // Ensure all threads have loaded the data
    
    // Write data from shared memory to global memory
    mphi[indexToWrite] = shared_dphi[indexInBlock];
    mpsix[indexToWrite] = shared_dpsix[indexInBlock];
    mpsiy[indexToWrite] = shared_dpsiy[indexInBlock];
}