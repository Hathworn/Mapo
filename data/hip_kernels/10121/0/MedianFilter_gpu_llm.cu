#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define MEDIAN_DIMENSION  3
#define MEDIAN_LENGTH 9

#define BLOCK_WIDTH 16
#define BLOCK_HEIGHT 16

__global__ void MedianFilter_gpu(unsigned short *Device_ImageData, int Image_Width, int Image_Height) {
    __shared__ unsigned short surround[BLOCK_WIDTH*BLOCK_HEIGHT][MEDIAN_LENGTH];
    
    int iterator;
    const int Half_Of_MEDIAN_LENGTH = (MEDIAN_LENGTH / 2) + 1;
    int StartPoint = MEDIAN_DIMENSION / 2;
    int EndPoint = StartPoint + 1;

    const int x = blockDim.x * blockIdx.x + threadIdx.x;
    const int y = blockDim.y * blockIdx.y + threadIdx.y;

    const int tid = threadIdx.y * blockDim.x + threadIdx.x; // Corrected tid calculation

    if (x >= Image_Width || y >= Image_Height)
        return;

    // Fill surround with pixel value of Image in MEDIAN_DIMENSION x MEDIAN_DIMENSION pattern
    if (x >= StartPoint && x < Image_Width - StartPoint && y >= StartPoint && y < Image_Height - StartPoint) {
        iterator = 0;
        for (int r = x - StartPoint; r < x + EndPoint; r++) {
            for (int c = y - StartPoint; c < y + EndPoint; c++) {
                surround[tid][iterator] = *(Device_ImageData + (c * Image_Width) + r);
                iterator++;
            }
        }

        // Optimized sort using selection sort
        for (int i = 0; i < Half_Of_MEDIAN_LENGTH; ++i) {
            int min = i;
            for (int l = i + 1; l < MEDIAN_LENGTH; ++l) {
                if (surround[tid][l] < surround[tid][min]) {
                    min = l;
                }
            }
            if (min != i) {
                unsigned short temp = surround[tid][i];
                surround[tid][i] = surround[tid][min];
                surround[tid][min] = temp;
            }
        }

        *(Device_ImageData + (y * Image_Width) + x) = surround[tid][Half_Of_MEDIAN_LENGTH - 1];
        __syncthreads();
    }
}