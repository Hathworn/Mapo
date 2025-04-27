#include "hip/hip_runtime.h"
#include "includes.h"

#define THRESHOLD 10010000

__device__ int cudaGetNextInColor(int *image, int x, int row, int imageWidth, int color){
    for (int i = x + 1; i < imageWidth; ++i) {
        if(THRESHOLD >= (color - image[row*imageWidth + i])){
            return i-1;
        }
    }
    return imageWidth - 1;
}

__device__ int cudaGetFirstNotInColor(int *image, int x, int row, int imageWidth, int color){
    for (int i = x; i < imageWidth; ++i) {
        if(THRESHOLD < (color - image[row*imageWidth + i])){
            return i;
        }
    }
    return -1;
}

__device__ void optimizedBubbleSort(int *pixelsToSort, int length){
    for(int i = 0; i < length; i++) {
        for(int j = 0; j < length-1; j++) {
            if(pixelsToSort[j] > pixelsToSort[j+1]){
                pixelsToSort[j] = pixelsToSort[j] ^ pixelsToSort[j+1];
                pixelsToSort[j+1] = pixelsToSort[j] ^ pixelsToSort[j+1];
                pixelsToSort[j] = pixelsToSort[j] ^ pixelsToSort[j+1];
            }
        }
    }
}

__global__ void optimizedSortRows(int *image, int imageHeight, int imageWidth, int colorMode){
    int row = blockIdx.x * blockDim.x + threadIdx.x; // Calculate row index
    if(row < imageHeight) {
        int startingX = 0;
        int finishX = 0;
        int pixelsToSort[1024]; // Use fixed-size array instead of dynamic allocation

        while(startingX < imageWidth) { // Ensure processing only relevant portions
            startingX = cudaGetFirstNotInColor(image, startingX, row, imageWidth, colorMode);
            if (startingX < 0) break; // Early exit if no more segments
            finishX = cudaGetNextInColor(image, startingX, row, imageWidth, colorMode);

            int pixelsToSortLength = min(finishX - startingX, 1024); // Simplify length calculation
            for (int i = 0; i < pixelsToSortLength; ++i) {
                pixelsToSort[i] = image[row*imageWidth + startingX + i];
            }

            optimizedBubbleSort(pixelsToSort, pixelsToSortLength);

            for (int i = 0; i < pixelsToSortLength; ++i) {
                image[row*imageWidth + startingX + i] = pixelsToSort[i];
            }

            startingX = finishX + 1; // Move to next segment
        }
    }
}