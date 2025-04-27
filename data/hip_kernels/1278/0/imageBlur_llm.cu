#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __INTELLISENSE__
void __syncthreads();
#endif

// image dimensions WIDTH & HEIGHT
#define WIDTH 256
#define HEIGHT 256

// Block width WIDTH & HEIGHT
#define BLOCK_W 16
#define BLOCK_H 16

// buffer to read image into
float image[HEIGHT][WIDTH];

// buffer for resulting image
float final[HEIGHT][WIDTH];

// prototype declarations
void load_image();
void call_kernel();
void save_image();

#define MAXLINE 128

float total, sobel;
hipEvent_t start_total, stop_total;
hipEvent_t start_sobel, stop_sobel;

__global__ void imageBlur(float *input, float *output, int width, int height) {
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    if (row < height && col < width && row > 0 && col > 0) {
        int numcols = WIDTH;

        // Use shared memory for block-wide operations
        __shared__ float sharedInput[BLOCK_H][BLOCK_W];

        int localRow = threadIdx.y;
        int localCol = threadIdx.x;

        // Load data into shared memory
        sharedInput[localRow][localCol] = input[row * numcols + col];
        __syncthreads();

        // Check boundaries for shared memory usage
        if (localRow > 0 && localRow < BLOCK_H - 1 && localCol > 0 && localCol < BLOCK_W - 1) {
            float blur = 0.2f * (
                sharedInput[localRow + 1][localCol] +     // up
                sharedInput[localRow][localCol - 1] +     // left
                sharedInput[localRow][localCol] +         // center
                sharedInput[localRow][localCol + 1] +     // right
                sharedInput[localRow - 1][localCol]       // down
            );

            output[row * numcols + col] = blur;
        }
    }
}