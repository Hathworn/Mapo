#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMultiply(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns) {
    // Calculate thread row and column within the C matrix
    int iRow = blockIdx.y * blockDim.y + threadIdx.y;
    int iCol = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread computes only valid entries
    if (iRow < numCRows && iCol < numCColumns) {
        float Cvalue = 0.0;
        
        // Use shared memory for tiles
        __shared__ float As[16][16];
        __shared__ float Bs[16][16];
        
        for (int k = 0; k < (numAColumns + 15) / 16; ++k) {
            // Load tiles into shared memory
            if (iRow < numARows && k * 16 + threadIdx.x < numAColumns) 
                As[threadIdx.y][threadIdx.x] = A[iRow * numAColumns + k * 16 + threadIdx.x];
            else
                As[threadIdx.y][threadIdx.x] = 0.0;
            
            if (k * 16 + threadIdx.y < numBRows && iCol < numBColumns) 
                Bs[threadIdx.y][threadIdx.x] = B[(k * 16 + threadIdx.y) * numBColumns + iCol];
            else
                Bs[threadIdx.y][threadIdx.x] = 0.0;
            
            __syncthreads();
            
            // Compute partial product
            for (int n = 0; n < 16; ++n) {
                Cvalue += As[threadIdx.y][n] * Bs[n][threadIdx.x];
            }
            
            __syncthreads();
        }
        
        // Write result to C matrix
        C[iRow * numCColumns + iCol] = Cvalue;
    }
}