#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void CombineTwoChannels_Single(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate global thread id using optimized formula
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * gridDim.x * blockDim.x + 
             blockIdx.z * gridDim.x * gridDim.y * blockDim.x; 

    // Return if id is out of bounds
    if (id >= SizeX * SizeY * SizeZ) {
        printf("Combine Two Channel 有 Error!\n");
        return;
    }

    int BoxSize = SizeX * SizeZ;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;

    // Optimize data access by combining two channel values
    OCTData[id] = (OCTData_2Channls[BoxIndex * 2 * BoxSize + BoxLeft] +
                   OCTData_2Channls[(BoxIndex * 2 + 1) * BoxSize + BoxLeft]) / 2;
}