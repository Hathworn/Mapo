#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addInc(unsigned int* deviceInput, unsigned int* deviceOutput, int eleCnt, unsigned int* deviceInc)
{
    // Load increment value into shared memory for each block
    __shared__ unsigned int inc;
    if (threadIdx.x == 0) {
        inc = deviceInc[blockIdx.x];
    }
    __syncthreads();

    int cntInB = blockDim.x * 2;
    int idxInG = blockIdx.x * cntInB + threadIdx.x;

    // Use shared memory increment for both indices
    if (idxInG < eleCnt) {
        deviceOutput[idxInG] = deviceInput[idxInG] + inc;
    }

    if (idxInG + blockDim.x < eleCnt) {
        deviceOutput[idxInG + blockDim.x] = deviceInput[idxInG + blockDim.x] + inc;
    }
}