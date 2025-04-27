#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ShiftFinalData(float* AfterFFTData, float* ShiftData, int SizeX, int SizeY, int FinalSizeZ, int FinalDataSize)
{
    // Calculate global thread id
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x + 
             blockIdx.x * gridDim.z * blockDim.x + 
             blockIdx.z * blockDim.x + 
             threadIdx.x;

    // Early exit if id is out of bounds
    if (id >= FinalDataSize) return;

    // Compute indices directly to reduce computation
    int idZ = id % FinalSizeZ;
    int tempIndex = id / FinalSizeZ;
    int idX = tempIndex % SizeX;
    int idY = (tempIndex / SizeX + SizeY / 2) % SizeY;  // Adjust for SizeY folding

    // Calculate the new index and set shifted data
    int NewIndex = idY * SizeX * FinalSizeZ + idX * FinalSizeZ + idZ;
    ShiftData[id] = AfterFFTData[NewIndex];
}