#include "hip/hip_runtime.h"
#include "includes.h"

#define DIMENSIONS 2
#define GPU_DEVICE_ZERO 0

__global__ void minimumClusterDistance(int threads, double *pointToClusterDistance, int *minimumPointToCluster, int pointsCounter, int clusterCounter)
{
    // Calculate global thread index
    int pointIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Only proceed if within bounds
    if (pointIndex < pointsCounter) 
    {
        int smallestIndex = 0;
        double min = pointToClusterDistance[pointIndex]; // Initialize min with first element
        
        // Loop through each cluster
        for (int index = 1; index < clusterCounter; ++index) 
        {
            double temp = pointToClusterDistance[pointIndex + index * pointsCounter];
            // Update minimum if a smaller distance is found
            if (temp < min) 
            {
                min = temp;
                smallestIndex = index; // Save new index of minimum distance
            }
        }
        
        minimumPointToCluster[pointIndex] = smallestIndex; // Assign nearest cluster index
    }
}