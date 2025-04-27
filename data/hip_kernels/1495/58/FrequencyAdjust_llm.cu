#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void FrequencyAdjust(int* __restrict__ OCTData, float* __restrict__ KSpaceData, float* __restrict__ PXScale, int* __restrict__ IndexArray, int CutIndex, int SizeX, int SizeY, int SizeZ) {
    // Calculate global thread index with reduced arithmetic operations
    int id = threadIdx.x + blockDim.x * (blockIdx.z + gridDim.z * (blockIdx.x + gridDim.x * blockIdx.y));

    // Check if global thread index is within bounds
    if (id >= SizeX * SizeY * SizeZ) {
        printf("Frequency transformation issue encountered\n");
        return;
    }

    // Calculate idZ and check conditions early to avoid unnecessary computations
    int idZ = id % SizeZ;
    if (IndexArray[idZ] == -1 || idZ >= CutIndex || idZ == 0) {
        KSpaceData[id] = 0;
        return;
    }

    // Compute the slope (m) and intercept (c)
    int index = IndexArray[idZ];
    int previousIndex = max(index - 1, 0);
    double m = (double)(OCTData[id] - OCTData[id - 1]) / (PXScale[index] - PXScale[previousIndex]);
    double c = OCTData[id] - m * PXScale[index];

    // Calculate the adjusted frequency value and assign
    KSpaceData[id] = m * idZ + c;
}