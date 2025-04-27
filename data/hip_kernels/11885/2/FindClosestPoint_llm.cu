#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindClosestPoint(float3 *points, int *closestPoint, const int numberPoints)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check to ensure valid index
    if (idx >= numberPoints) return;

    // Initialize minimal distance with a large number
    int distanceBetweenPoints = INT_MAX;
    int tempDistance;
    
    // Iterate over all points to find the closest one
    for (int j = 0; j < numberPoints; j++)
    {
        // Skip calculating distance from point to itself
        if (idx != j)
        {
            // Calculate squared distance to avoid sqrt and improve performance
            tempDistance = (points[idx].x - points[j].x) * (points[idx].x - points[j].x)
                         + (points[idx].y - points[j].y) * (points[idx].y - points[j].y);

            // Update the closest point if a closer one is found
            if (tempDistance < distanceBetweenPoints)
            {
                distanceBetweenPoints = tempDistance;
                closestPoint[idx] = j;
            }
        }
    }
}