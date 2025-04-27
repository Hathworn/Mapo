#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kmeans4(short int *input, short int *centroids, int *newcentroids, int *counter, const int n)
{
    const int Dim = 4;
    const int i = blockIdx.x * blockDim.x + threadIdx.x * Dim;
    
    if (i < n) {
        // Load point dimensions
        int point[Dim];
        for (int d = 0; d < Dim; ++d) {
            point[d] = input[i + d];
        }

        // Compute squared distances to centroids
        int squaredDistances[4] = {0};
        #pragma unroll
        for (int k = 0; k < 4; ++k) {
            int offset = k * Dim;
            for (int d = 0; d < Dim; ++d) {
                int diff = point[d] - centroids[offset + d];
                squaredDistances[k] += diff * diff;
            }
        }

        // Reduce to find the minimum distance centroid
        int minIdx = 0;
        int minDist = squaredDistances[0];
        for (int k = 1; k < 4; ++k) {
            if (squaredDistances[k] < minDist) {
                minDist = squaredDistances[k];
                minIdx = k;
            }
        }

        // Update new centroids and counters
        int newCentroidIdx = Dim * minIdx;
        for (int d = 0; d < Dim; ++d) {
            atomicAdd(&newcentroids[newCentroidIdx + d], point[d]);
        }
        atomicAdd(&counter[minIdx], 1);
    }
}