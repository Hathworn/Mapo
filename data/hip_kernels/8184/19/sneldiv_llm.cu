```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sneldiv(unsigned short *inA, float *inB, int *sub, int Nprj, int snno)
{
    int idz = threadIdx.x + blockDim.x * blockIdx.x;
    // Calculate index once for efficiency
    int globalIndex = snno * blockIdx.y + idz;
    
    if (blockIdx.y < Nprj && idz < snno) {
        // Load values from global memory to local variables for faster access
        float inputA = (float)inA[snno * sub[blockIdx.y] + idz];
        float inputB = inB[globalIndex];

        // Perform division
        float result = inputA / inputB;

        // Store result back to global memory
        inB[globalIndex] = result;
    }
}