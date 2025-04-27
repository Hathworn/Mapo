#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void ReverseBackScanData(int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate unique global thread ID
    int id = (blockIdx.y * 2 + 1) * gridDim.x * 2 * gridDim.z * blockDim.x +
             blockIdx.x * gridDim.z * blockDim.x +
             blockIdx.z * blockDim.x +
             threadIdx.x;

    // Calculate mirrored thread ID for reverse operation
    int changeID = (blockIdx.y * 2 + 1) * gridDim.x * 2 * gridDim.z * blockDim.x +
                   (gridDim.y * 2 - blockIdx.x - 1) * gridDim.z * blockDim.x +
                   blockIdx.z * blockDim.x +
                   threadIdx.x;

    // Optimize swapping using a temporary variable
    int value = OCTData[id];
    OCTData[id] = OCTData[changeID];
    OCTData[changeID] = value;
}