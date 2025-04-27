#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void CombineTwoChannels_Multi(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate global thread ID
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x +
             blockIdx.x * gridDim.z * blockDim.x +
             blockIdx.z * blockDim.x +
             threadIdx.x;

    // Check if the thread ID is out of bounds
    if (id >= SizeX * SizeY * SizeZ)
    {
        printf("Combine Two Channel 有 Error!\n");
        return;
    }

    int BoxSize = SizeX * SizeZ * 2;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;

    // Efficient memory access pattern
    int baseIndex1 = BoxIndex * 2 * BoxSize + BoxLeft;
    int baseIndex2 = (BoxIndex * 2 + 1) * BoxSize + BoxLeft;
    
    OCTData[id] = (OCTData_2Channls[baseIndex1] + OCTData_2Channls[baseIndex2]) / 2;
}