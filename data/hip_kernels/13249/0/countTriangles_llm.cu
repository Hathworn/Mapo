#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void countTriangles(uint2 *validPoints, int *count)
{
    // Calculate unique thread index based on block indices
    int idx1 = blockIdx.x;
    int idx2 = blockIdx.y;
    int idx3 = blockIdx.z;

    // Ensure unique triangle by ensuring index order: x < y < z
    if (idx1 >= idx2 || idx2 >= idx3 || idx1 >= idx3)
        return;

    // Load valid points based on calculated indices
    uint2 x = validPoints[idx1];
    uint2 y = validPoints[idx2];
    uint2 z = validPoints[idx3];

    // Check if points are coplanar or coincident
    if ((x.x == y.x && x.x == z.x) || (x.y == y.y && x.y == z.y) ||
        (y.x == z.x && x.x == y.x) || (y.y == z.y && x.y == y.y))
        return;

    if ((x.x == y.x && x.y == y.y) || (y.x == z.x && y.y == z.y) || 
        (x.x == z.x && x.y == z.y))
        return;

    // Increment count if a valid triangle is formed
    atomicAdd(count, 1);
}