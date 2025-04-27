#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void CombineTwoChannels_Multi(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate the global thread ID more efficiently
    int id = blockIdx.x * blockDim.x + threadIdx.x +
             blockIdx.y * gridDim.x * blockDim.x +
             blockIdx.z * gridDim.x * gridDim.y * blockDim.x;

    if (id >= SizeX * SizeY * SizeZ) // Check if ID exceeds data range
    {
        printf("Combine Two Channel 有 Error!\n");
        return;
    }

    int BoxSize = SizeX * SizeZ * 2;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;

    // Perform computation with improved memory access logic
    int index1 = BoxIndex * 2 * BoxSize + BoxLeft;
    int index2 = (BoxIndex * 2 + 1) * BoxSize + BoxLeft;
    OCTData[id] = (OCTData_2Channls[index1] + OCTData_2Channls[index2]) / 2;
}