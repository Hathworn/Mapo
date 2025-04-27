```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
  
    // Guard for the total number of output elements
    if(i < (NX + NY) * B)
    {
        // Calculate batch index and element index
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Use ternary operator for simplified condition
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}