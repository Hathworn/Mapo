#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void CombineTwoChannels_Single(int* OCTData_2Channls, int* OCTData, int SizeX, int SizeY, int SizeZ)
{
    // Calculate global thread id directly using optimized formula
    int id = (blockIdx.z * gridDim.x * gridDim.y +
              blockIdx.y * gridDim.x +
              blockIdx.x) * blockDim.x + threadIdx.x;

    // Avoid out-of-bounds access
    if (id >= SizeX * SizeY * SizeZ) return;

    // Pre-computed BoxSize for performance improvement
    int BoxSize = SizeX * SizeZ;
    int BoxIndex = id / BoxSize;
    int BoxLeft = id % BoxSize;

    // Efficiently compute average and write to output
    int index1 = BoxIndex * 2 * BoxSize + BoxLeft;
    int index2 = (BoxIndex * 2 + 1) * BoxSize + BoxLeft;
    OCTData[id] = (OCTData_2Channls[index1] + OCTData_2Channls[index2]) / 2;
}