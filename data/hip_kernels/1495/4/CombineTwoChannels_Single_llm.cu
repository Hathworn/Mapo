```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void CombineTwoChannels_Single(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Compute a unique global index for each thread
    int id = blockIdx.x * blockDim.x + threadIdx.x + 
             blockIdx.y * gridDim.x * blockDim.x + 
             blockIdx.z * gridDim.x * gridDim.y * blockDim.x;
    
    if (id >= SizeX * SizeY * SizeZ)
    {
        printf("Combine Two Channel error!\n");
        return;
    }
    
    int BoxSize = SizeX * SizeZ;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;
    
    // Optimize memory access patterns
    int idx1 = BoxIndex * 2 * BoxSize + BoxLeft;
    int idx2 = (BoxIndex * 2 + 1) * BoxSize + BoxLeft;
    
    OCTData[id] = (OCTData_2Channls[idx1] + OCTData_2Channls[idx2]) >> 1; // Use bitwise shift for division by 2
}