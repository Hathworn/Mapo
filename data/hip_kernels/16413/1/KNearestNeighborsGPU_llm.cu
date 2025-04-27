#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

void KNearestNeighborsCPU(float3 *dataArray, int *result, int cnt);

// cpu algorithm
__global__ void KNearestNeighborsGPU(float3 *dataArray, int *result, int cnt)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= cnt) return;

    float3 point = dataArray[id];
    float minimumDist = FLT_MAX; // Use pre-defined maximum value
    float3 current;
    float distance;

    for (int j = 0; j < cnt; ++j)
    {
        if (id == j) continue;

        current = dataArray[j];
        // Calculate distance using common subexpression elimination
        float dx = point.x - current.x;
        float dy = point.y - current.y;
        float dz = point.z - current.z;

        distance = dx * dx + dy * dy + dz * dz;
        
        if (distance < minimumDist)
        {
            minimumDist = distance;
            result[id] = j;
        }
    }
}