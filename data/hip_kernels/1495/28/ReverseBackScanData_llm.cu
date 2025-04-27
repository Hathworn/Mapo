```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ReverseBackScanData(int* OCTData, int SizeX, int SizeY, int SizeZ) {
    // Calculate thread index for forward and reverse elements with fewer operations
    int idx = threadIdx.x + blockDim.x * (blockIdx.z + gridDim.z * (blockIdx.x + gridDim.x * (blockIdx.y * 2 + 1)));
    int rdx = threadIdx.x + blockDim.x * (blockIdx.z + gridDim.z * ((gridDim.y * 2 - blockIdx.x - 1) + gridDim.x * (blockIdx.y * 2 + 1)));

    // Swap the values efficiently
    int temp = OCTData[idx];
    OCTData[idx] = OCTData[rdx];
    OCTData[rdx] = temp;
}