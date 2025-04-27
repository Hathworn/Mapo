#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;  // Calculate gridSize to handle large data

    for (; i < (NX + NY) * B; i += gridSize) {  // Loop to process all data in chunks
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        if (j < NX) {
            if(X) atomicAdd(&X[b*NX + j], OUT[i]);  // Use atomicAdd for concurrent writes
        } else {
            if(Y) atomicAdd(&Y[b*NY + j - NX], OUT[i]);  // Use atomicAdd for concurrent writes
        }
    }
}