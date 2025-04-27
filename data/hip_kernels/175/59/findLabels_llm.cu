#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findLabels(int nPixels, int filterCount, int clusterCount, float* responses, float* centroids, int* clusters, int* changes) {
    __shared__ float sharedCentroids[34 * 32];
    __shared__ unsigned int localChanges;

    int x = blockDim.x * blockIdx.x + threadIdx.x;

    // Load centroids into shared memory for both set of labels (0-31 and 32-63)
    if (threadIdx.x < 64) {
        int base = (threadIdx.x < 32) ? 0 : 32;
        int idx = threadIdx.x % 32;
        for (int i = 0; i < 34; i++) {
            float element = centroids[i * 64 + idx + base];
            sharedCentroids[i * 32 + idx] = element;
        }
    }
    __syncthreads();

    float bestDistance = FLT_MAX;
    int bestLabel = -1;

    // Process pixels
    if (x < nPixels) {
        for (int segment = 0; segment < 2; segment++) {
            int offset = segment * 32;
            for (int label = 0; label < 32; label++) {
                float accumulant = 0.0f;
                int index = x;
                for (int dimension = 0; dimension < 34; dimension++) {
                    float diff = sharedCentroids[dimension * 32 + label + offset] - responses[index];
                    accumulant += diff * diff;
                    index += nPixels;
                }
                if (accumulant < bestDistance) {
                    bestDistance = accumulant;
                    bestLabel = label + offset;
                }
            }
            __syncthreads(); // Ensure all threads are in sync before next loading phase
        }

        int formerCluster = clusters[x];
        if (bestLabel != formerCluster) {
            atomicInc(&localChanges, 10000000);
        }
        clusters[x] = bestLabel;
    }

    __syncthreads();

    if (threadIdx.x == 0) {
        atomicAdd(changes, localChanges);
    }
}