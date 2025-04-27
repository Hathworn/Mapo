#include "hip/hip_runtime.h"
#include "includes.h"

#define FILTER_SIZE (FILTER_WIDTH * FILTER_HEIGHT)

__device__ void sort(unsigned char* filterVector) {
    // Simple insertion sort for the small filter size
    for (int i = 1; i < FILTER_SIZE; ++i) {
        unsigned char key = filterVector[i];
        int j = i - 1;
        while (j >= 0 && filterVector[j] > key) {
            filterVector[j + 1] = filterVector[j];
            j--;
        }
        filterVector[j + 1] = key;
    }
}

__global__ void medianFilter(unsigned char *srcImage, unsigned char *dstImage, unsigned int width, unsigned int height, int channel) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Only threads inside image will write results
    if ((x >= FILTER_WIDTH / 2) && (x < (width - FILTER_WIDTH / 2)) && 
        (y >= FILTER_HEIGHT / 2) && (y < (height - FILTER_HEIGHT / 2))) {
        for (int c = 0; c < channel; c++) {
            unsigned char filterVector[FILTER_SIZE];

            // Loop inside the filter to average pixel values
            for (int ky = -FILTER_HEIGHT / 2; ky <= FILTER_HEIGHT / 2; ky++) {
                for (int kx = -FILTER_WIDTH / 2; kx <= FILTER_WIDTH / 2; kx++) {
                    int index = (ky + FILTER_HEIGHT / 2) * FILTER_WIDTH + (kx + FILTER_WIDTH / 2);
                    filterVector[index] = srcImage[((y + ky) * width + (x + kx)) * channel + c];
                }
            }

            // Sorting values of filter
            sort(filterVector);
            dstImage[(y * width + x) * channel + c] = filterVector[FILTER_SIZE / 2];
        }
    }
}