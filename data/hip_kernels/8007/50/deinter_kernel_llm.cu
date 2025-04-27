#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * gridDim.x * blockDim.x); 

    // Ensure thread index is within bounds
    if(i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        if (j < NX){
            if(X) X[b * NX + j] += OUT[i];
        } else {
            if(Y) Y[b * NY + (j - NX)] += OUT[i];
        }
    }
}