#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void FrequencyAdjust(int* OCTData, float* KSpaceData, float* PXScale, int* IndexArray, int CutIndex, int SizeX, int SizeY, int SizeZ)
{
    // Calculate a global index using 3D grid and block dimensions
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x +
             blockIdx.x * gridDim.z * blockDim.x +
             blockIdx.z * blockDim.x +
             threadIdx.x;

    // Boundary check to ensure id is within the data range
    if (id >= SizeX * SizeY * SizeZ)
    {
        printf("Frequency conversion issue detected");
        return;
    }

    // Calculate the Z index from the global id
    int idZ = id % SizeZ;

    // Conditions leading to zeroization of KSpaceData
    if (IndexArray[idZ] == -1 || idZ >= CutIndex || idZ == 0)
    {
        KSpaceData[id] = 0;
        return;
    }

    // Retrieve index of previous PXScale value, ensuring it is not negative
    int LastPXScaleIndex = max(IndexArray[idZ] - 1, 0);

    // Compute slope (m) and intercept (c) for linear equation
    double m = static_cast<double>(OCTData[id] - OCTData[id - 1]) / (PXScale[IndexArray[idZ]] - PXScale[LastPXScaleIndex]);
    double c = OCTData[id] - m * PXScale[IndexArray[idZ]];

    // Calculate adjusted KSpaceData using the linear equation
    KSpaceData[id] = m * idZ + c;
}