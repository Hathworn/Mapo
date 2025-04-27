#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shMatMul_Kernel(int matrixSize, float* matrixA, float* matrixB, float* matrixC)
{
    extern __shared__ float sh_Mem[];
    int tilewidth = blockDim.x;
    float *sh_MatrixA = &(sh_Mem[0]);
    float *sh_MatrixB = &(sh_Mem[tilewidth * tilewidth]);

    int elementIdx = blockIdx.x * blockDim.x + threadIdx.x; // Col
    int elementIdy = blockIdx.y * blockDim.y + threadIdx.y; // Row

    int elementId = elementIdy * matrixSize + elementIdx;
    float CValue = 0;
    
    if (elementIdx < matrixSize && elementIdy < matrixSize) {
        for (int m = 0; m < (matrixSize + tilewidth - 1) / tilewidth; ++m) {
            // Load inputs into shared memory safely with boundary checks
            if (threadIdx.x + m * tilewidth < matrixSize)
                sh_MatrixA[tilewidth * threadIdx.y + threadIdx.x] = matrixA[elementIdy * matrixSize + (m * tilewidth + threadIdx.x)];
            else
                sh_MatrixA[tilewidth * threadIdx.y + threadIdx.x] = 0.0f;
                
            if (threadIdx.y + m * tilewidth < matrixSize)
                sh_MatrixB[tilewidth * threadIdx.y + threadIdx.x] = matrixB[elementIdx + (m * tilewidth + threadIdx.y) * matrixSize];
            else
                sh_MatrixB[tilewidth * threadIdx.y + threadIdx.x] = 0.0f;
                
            __syncthreads();

            // Compute matrix multiplication for the sub-matrix
            for (int k = 0; k < tilewidth; ++k)
                CValue += sh_MatrixA[tilewidth * threadIdx.y + k] * sh_MatrixB[tilewidth * k + threadIdx.x];
                
            __syncthreads();
        }

        // Store output value back to global memory
        matrixC[elementId] = CValue;
    }
}