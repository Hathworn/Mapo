#include "hip/hip_runtime.h"
#include "includes.h"


#define DIMENSIONS 2
#define GPU_DEVICE_ZERO 0



__global__ void distanceArrCalc(int pointsCounter, int threads, double *distanceFromPointToCluster, double *pointsInGpu, double *clustersInGpu)
{
    // Use shared memory to optimize data access
    __shared__ double sharedClusters[DIMENSIONS * blockDim.y];

    double distanceX = 0;
    double distanceY = 0;
    
    // Calculate and load clusters data into shared memory
    if (threadIdx.x < blockDim.y) {
        int index = threadIdx.x * DIMENSIONS;
        sharedClusters[index] = clustersInGpu[index];
        sharedClusters[index + 1] = clustersInGpu[index + 1];
    }
    __syncthreads();

    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (globalThreadId < pointsCounter) {
        int offsetPointIndex = globalThreadId * DIMENSIONS;
        int offsetClusterIndexForPoint = threadIdx.y * DIMENSIONS;

        // Load points data
        double pointX = pointsInGpu[offsetPointIndex];
        double pointY = pointsInGpu[offsetPointIndex + 1];

        // Load clusters data from shared memory
        double clusterX = sharedClusters[offsetClusterIndexForPoint];
        double clusterY = sharedClusters[offsetClusterIndexForPoint + 1];

        // Calculate squared distances
        distanceX = (pointX - clusterX) * (pointX - clusterX);
        distanceY = (pointY - clusterY) * (pointY - clusterY);

        // Compute total distance and store result
        double totalDistance = sqrt(distanceX + distanceY);
        int currentPointIndexY = pointsCounter * threadIdx.y;
        int pointIndex = currentPointIndexY + globalThreadId;
        distanceFromPointToCluster[pointIndex] = totalDistance;
    }
}