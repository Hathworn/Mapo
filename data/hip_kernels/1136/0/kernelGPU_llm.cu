#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for reduction and reduce global memory accesses
__global__ void kernelGPU(float *R, float *G, float *B, float *Rin, float *Gin, float *Bin, int M, int N, int L) {

    int tId = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = M * N;
    
    // Declare shared memory
    __shared__ float sR[256];
    __shared__ float sG[256];
    __shared__ float sB[256];
    
    float rSum = 0.0f, gSum = 0.0f, bSum = 0.0f;
    int i;

    if (tId < M * N) {
        for (i = threadIdx.x; i < L; i += blockDim.x) {
            rSum += Rin[tId + i * stride];
            gSum += Gin[tId + i * stride];
            bSum += Bin[tId + i * stride];
        }
        
        // Reduction within the block
        sR[threadIdx.x] = rSum;
        sG[threadIdx.x] = gSum;
        sB[threadIdx.x] = bSum;
        
        __syncthreads();
                
        // Reduce sum within a block
        for (unsigned int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
            if (threadIdx.x < offset) {
                sR[threadIdx.x] += sR[threadIdx.x + offset];
                sG[threadIdx.x] += sG[threadIdx.x + offset];
                sB[threadIdx.x] += sB[threadIdx.x + offset];
            }
            __syncthreads();
        }
        
        // First thread in the block writes the result back to global memory
        if (threadIdx.x == 0) {
            R[blockIdx.x] = sR[0] / L;
            G[blockIdx.x] = sG[0] / L;
            B[blockIdx.x] = sB[0] / L;
        }
    }
}