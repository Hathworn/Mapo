#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulVarSharedMemoryKernel(float* M, float* N, float* P, int widthAHeightB, int heightA, int widthB) {

    int Mstart=widthAHeightB*tileSize*blockIdx.y;
    int Mend=Mstart+ widthAHeightB - 1;
    int mstep=tileSize;
    int Nstart=tileSize*blockIdx.x;
    int nstep=tileSize*widthB;
    float temp=0;

    __shared__ float Ms[tileSize][tileSize];
    __shared__ float Ns[tileSize][tileSize];
    
    // Simplified area where the tiles fit without boundary issues
    for(int m = Mstart, n = Nstart; m <= Mend; m += mstep, n += nstep) {
        
        // Load shared memory with conditions to prevent out-of-bounds
        Ms[threadIdx.y][threadIdx.x] = (m % widthAHeightB + threadIdx.x < widthAHeightB && blockIdx.y * tileSize + threadIdx.y < heightA) ? 
                                       M[m + widthAHeightB * threadIdx.y + threadIdx.x] : 0.0f;
        
        Ns[threadIdx.y][threadIdx.x] = ((n / widthB) + threadIdx.y < widthAHeightB && blockIdx.x * tileSize + threadIdx.x < widthB) ? 
                                       N[n + widthB * threadIdx.y + threadIdx.x] : 0.0f;

        __syncthreads();
        
        // Compute partial results
        for (int i = 0; i < tileSize; ++i) {
            temp += Ms[threadIdx.y][i] * Ns[i][threadIdx.x];
        }
        __syncthreads();
    }
    
    // Write the result to global memory with bounds checking
    if(blockIdx.y * tileSize + threadIdx.y < heightA && blockIdx.x * tileSize + threadIdx.x < widthB) {
        P[widthB * tileSize * blockIdx.y + tileSize * blockIdx.x + widthB * threadIdx.y + threadIdx.x] = temp;
    }
}