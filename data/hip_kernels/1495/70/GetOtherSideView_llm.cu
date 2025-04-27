#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void GetOtherSideView(float* Data, float* OtherSideData, int SizeX, int SizeY, int FinalSizeZ)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Check within bounds
    if (id >= SizeX * SizeY) {
        printf("範圍有錯!!\n");
        return;
    }

    // Calculate indices
    int idX = id / SizeY;
    int idY = id % SizeY;
    int DataOffsetIndex = idX * SizeY * FinalSizeZ + idY * FinalSizeZ;

    // Calculate totalZ for the current id
    float totalZ = 0;
    for (int i = 0; i < FinalSizeZ; i++)
        totalZ += Data[DataOffsetIndex + i];
    
    // Compute and set OtherSideData offset
    int offsetIndex = idY * SizeX + idX;
    OtherSideData[offsetIndex] = totalZ;
}