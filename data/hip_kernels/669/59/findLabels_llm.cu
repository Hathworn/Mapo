```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findLabels(int nPixels, int filterCount, int clusterCount, float* responses, float* centroids, int* clusters, int* changes) {
    __shared__ float sharedCentroids[34 * 32];
    __shared__ unsigned int localChanges;
    int x = blockDim.x * blockIdx.x + threadIdx.x;

    // Load the first set of 32 centroids into shared memory
    if (threadIdx.x < 32) {
        for (int i = 0; i < 34; i++) {
            sharedCentroids[i * 32 + threadIdx.x] = centroids[i * 64 + threadIdx.x];
        }
    }
    __syncthreads();

    int bestLabel = -1;
    float bestDistance = 1000000.0f;

    // Calculate distances for the first set of 32 centroids
    if (x < nPixels) {
        for (int label = 0; label < 32; label++) {
            float accumulant = 0.0f;
            int index = x;
            for (int dimension = 0; dimension < 34; dimension++) {
                float diff = sharedCentroids[dimension * 32 + label] - responses[index];
                accumulant += diff * diff;
                index += nPixels;
            }
            if (accumulant < bestDistance) {
                bestLabel = label;
                bestDistance = accumulant;
            }
        }
    }

    // Load the second set of 32 centroids into shared memory
    if (threadIdx.x < 32) {
        for (int i = 0; i < 34; i++) {
            sharedCentroids[i * 32 + threadIdx.x] = centroids[i * 64 + threadIdx.x + 32];
        }
    }
    __syncthreads();

    // Calculate distances for the second set of 32 centroids
    if (x < nPixels) {
        for (int label = 0; label < 32; label++) {
            float accumulant = 0.0f;
            int index = x;
            for (int dimension = 0; dimension < 34; dimension++) {
                float diff = sharedCentroids[dimension * 32 + label] - responses[index];
                accumulant += diff * diff;
                index += nPixels;
            }
            if (accumulant < bestDistance) {
                bestLabel = label + 32;
                bestDistance = accumulant;
            }
        }
        // Update cluster changes
        int formerCluster = clusters[x];
        if (bestLabel != formerCluster) {
            atomicAdd(&localChanges, 1); // Use atomicAdd for changes
            clusters[x] = bestLabel;
        }
    }
    __syncthreads();

    // Accumulate total changes
    if (threadIdx.x == 0) {
        atomicAdd(changes, localChanges);
    }
}