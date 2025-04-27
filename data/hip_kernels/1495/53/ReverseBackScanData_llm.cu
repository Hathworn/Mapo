#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ReverseBackScanData(int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate 1D index using Y, X, Z, and thread index
    int id = (blockIdx.y * 2 + 1) * gridDim.x * 2 * gridDim.z * blockDim.x +
             blockIdx.x * gridDim.z * blockDim.x +
             blockIdx.z * blockDim.x +
             threadIdx.x;

    // Calculate mirrored index for reverse operation.
    int changeID = (blockIdx.y * 2 + 1) * gridDim.x * 2 * gridDim.z * blockDim.x +
                   (gridDim.x * 2 - blockIdx.x - 1) * gridDim.z * blockDim.x +
                   blockIdx.z * blockDim.x +
                   threadIdx.x;

    // Swap values using atomic operations for potentially higher safety in concurrent environments.
    int value = atomicExch(&OCTData[id], OCTData[changeID]);
    atomicExch(&OCTData[changeID], value);
}