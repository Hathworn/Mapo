#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void CombineTwoChannels_Multi(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Improved computation of global thread id for clarity
    int id = blockIdx.x + blockIdx.y * gridDim.x + blockIdx.z * gridDim.x * gridDim.y;
    id = id * blockDim.x + threadIdx.x;

    // Check bounds
    if (id >= SizeX * SizeY * SizeZ)
    {
        printf("Combine Two Channel 有 Error!\n");
        return;
    }

    // Compute offsets for channel combination
    int BoxSize = SizeX * SizeZ * 2;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;

    // Improved memory access pattern
    int index1 = BoxIndex * BoxSize * 2 + BoxLeft;
    int index2 = (BoxIndex * 2 + 1) * BoxSize + BoxLeft;
    
    // Combine channels
    OCTData[id] = (OCTData_2Channls[index1] + OCTData_2Channls[index2]) / 2;
}