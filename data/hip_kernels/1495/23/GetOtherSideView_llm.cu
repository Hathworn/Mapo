#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void GetOtherSideView(float* Data, float* OtherSideData, int SizeX, int SizeY, int FinalSizeZ)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= SizeX * SizeY)
    {
        return; // Remove unnecessary printf for efficiency
    }

    // Compute idX and idY
    int idX = id / SizeY;
    int idY = id % SizeY;
    int DataOffsetIndex = idX * SizeY * FinalSizeZ + idY * FinalSizeZ;

    // Sum up elements in the Z dimension
    float totalZ = 0.0f; // Initialize with 0.0f for consistency in floating-point arithmetic
    for (int i = 0; i < FinalSizeZ; i++)
    {
        totalZ += Data[DataOffsetIndex + i];
    }

    // Calculate and save result into OtherSideData
    int offsetIndex = idY * SizeX + idX;
    OtherSideData[offsetIndex] = totalZ;
}