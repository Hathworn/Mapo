#include "hip/hip_runtime.h"
#include "includes.h"
/**************************************************************************************************
*
*       Computer Engineering Group, Heidelberg University - GPU Computing Exercise 06
*
*                 Gruppe : gpucomp02
*
*                   File : main.cu
*
*                Purpose : Reduction
*
**************************************************************************************************/


const static int DEFAULT_MATRIX_SIZE = 1024;
const static int DEFAULT_BLOCK_DIM   = 128;

//
// Function Prototypes
//
void printHelp(char *);

//
// CPU
//
__global__ void reduction_KernelOptimized(int numElements, float* dataIn, float* dataOut)
{
    extern __shared__ float sPartArray[];

    const int tid = threadIdx.x;
    unsigned int elementId = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (elementId < numElements) {
        sPartArray[tid] = dataIn[elementId];
    } else { 
        sPartArray[tid] = 0.0f; // Avoid accessing out of bounds
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sPartArray[tid] += sPartArray[tid + s];
        }
        __syncthreads();
    }

    // Write result from block to global memory
    if (tid == 0) {
        dataOut[blockIdx.x] = sPartArray[0];
    }
}