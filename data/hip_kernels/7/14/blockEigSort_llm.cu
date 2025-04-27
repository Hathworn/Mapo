#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blockEigSort( float *eigenvalues, float *eigenvectors, int *blocknums, int *blocksizes, int N ) {
    int blockNumber = blockIdx.x * blockDim.x + threadIdx.x;
    int startspot = blocknums[blockNumber];
    int endspot = startspot + blocksizes[blockNumber] - 1;

    // Use a more efficient sorting algorithm: selection sort
    for(int i = startspot; i < endspot; i++) {
        int minIndex = i;
        for(int j = i + 1; j <= endspot; j++) {
            if(eigenvalues[j] < eigenvalues[minIndex]) {
                minIndex = j; 
            }
        }
        if(minIndex != i) {
            float tmp = eigenvalues[i];
            eigenvalues[i] = eigenvalues[minIndex];
            eigenvalues[minIndex] = tmp;

            // Swap associated eigenvectors
            for(int k = 0; k < N; k++) {
                tmp = eigenvectors[k * N + i];
                eigenvectors[k * N + i] = eigenvectors[k * N + minIndex];
                eigenvectors[k * N + minIndex] = tmp;
            }
        }
    }
}