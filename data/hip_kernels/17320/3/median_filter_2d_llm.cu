#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_WINDOW FILTER_SIZE

__device__ int index(int x, int y, int width) {
    return (y * width) + x;
}

__device__ const int FILTER_SIZE = 9;
__device__ const int FILTER_HALFSIZE = FILTER_SIZE >> 1; 

__device__ void sort_bubble(float *x, int n_size) {
    for (int i = 0; i < n_size - 1; i++) {
        for(int j = 0; j < n_size - i - 1; j++) {
            if (x[j] > x[j+1]) {
                float temp = x[j];
                x[j] = x[j+1];
                x[j+1] = temp;
            }
        }
    }
}

__global__ void median_filter_2d(unsigned char* input, unsigned char* output, int width, int height) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Terminate threads that fall outside image boundaries
    if(x >= width || y >= height) return;

    const int color_tid = index(x, y, width);
    float windowMedian[MAX_WINDOW * MAX_WINDOW];
    int windowElements = 0;

    // Use local variables for filter size calculations for better performance
    const int startX = max(0, x - FILTER_HALFSIZE);
    const int startY = max(0, y - FILTER_HALFSIZE);
    const int endX = min(width - 1, x + FILTER_HALFSIZE);
    const int endY = min(height - 1, y + FILTER_HALFSIZE);

    for (int x_iter = startX; x_iter <= endX; x_iter++) {
        for (int y_iter = startY; y_iter <= endY; y_iter++) {
            windowMedian[windowElements++] = input[index(x_iter, y_iter, width)];
        }
    }

    // Sort and assign median
    sort_bubble(windowMedian, windowElements);
    output[color_tid] = windowMedian[windowElements / 2];
}