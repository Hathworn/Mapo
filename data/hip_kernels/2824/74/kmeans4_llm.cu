#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kmeans4(short int *input, short int *centroids, int *newcentroids, int *counter, const int n)
{
    int Dim = 4;
    int i = (blockIdx.x * blockDim.x + threadIdx.x) * Dim;
    if (i < n) {
        // Load point dimensions
        int point[4];
        #pragma unroll
        for (int d = 0; d < Dim; ++d) {
            point[d] = input[i + d];
        }

        // Compute squared distances to centroids
        int distances[4] = {0};
        #pragma unroll
        for (int k = 0; k < 4; ++k) {
            #pragma unroll
            for (int d = 0; d < Dim; ++d) {
                int diff = point[d] - centroids[k * Dim + d];
                distances[k] += diff * diff;
            }
        }
        
        // Find the nearest centroid
        int minIndex = 0;
        int minValue = distances[0];
        #pragma unroll
        for (int k = 1; k < 4; ++k) {
            if (distances[k] < minValue) {
                minValue = distances[k];
                minIndex = k;
            }
        }

        // Atomically update new centroids and counter
        #pragma unroll
        for (int d = 0; d < Dim; ++d) {
            atomicAdd(&(newcentroids[minIndex * Dim + d]), point[d]);
        }
        atomicAdd(&(counter[minIndex]), 1);
    }
}