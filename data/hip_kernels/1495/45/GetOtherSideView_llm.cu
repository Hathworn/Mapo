#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void GetOtherSideView(float* Data, float* OtherSideData, int SizeX, int SizeY, int FinalSizeZ)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if the thread index is out of bounds
    if (id >= SizeX * SizeY) return;
    
    // Calculate row and column indices
    int idX = id / SizeY;
    int idY = id % SizeY;
    int DataOffsetIndex = idX * SizeY * FinalSizeZ + idY * FinalSizeZ;

    // Accumulate the sum of the Z dimension
    float totalZ = 0.0f;
    for (int i = 0; i < FinalSizeZ; i++)
    {
        totalZ += Data[DataOffsetIndex + i];
    }

    // Calculate the correct offset index and store the result
    int offsetIndex = idY * SizeX + idX;
    OtherSideData[offsetIndex] = totalZ;
}