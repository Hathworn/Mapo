#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < (NX + NY) * B){
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Use shared memory to enhance memory access patterns
        __shared__ float sharedOUT[1024];
        sharedOUT[threadIdx.x] = OUT[i];
        __syncthreads();

        if (j < NX){
            if(X) atomicAdd(&(X[b * NX + j]), sharedOUT[threadIdx.x]); // Use atomic to ensure correct sum
        } else {
            if(Y) atomicAdd(&(Y[b * NY + j - NX]), sharedOUT[threadIdx.x]); // Use atomic to ensure correct sum
        }
    }
}