#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __INTELLISENSE__
void __syncthreads();
#endif

#define WIDTH 256
#define HEIGHT 256

#define BLOCK_W 16
#define BLOCK_H 16

float image[HEIGHT][WIDTH];
float final[HEIGHT][WIDTH];

void load_image();
void call_kernel();
void save_image();

#define MAXLINE 128

float total, sobel;
hipEvent_t start_total, stop_total;
hipEvent_t start_sobel, stop_sobel;

__global__ void sobelFilter(float *input, float *output, int width, int height) {
    int col = threadIdx.x + blockIdx.x * blockDim.x;
    int row = threadIdx.y + blockIdx.y * blockDim.y;

    if (row < height && col < width && row > 0 && col > 0) {
        // Use numcols directly inside the kernel for simplicity
        const int numcols = WIDTH;

        // Precompute indices to avoid redundant calculations
        int idx = row * numcols + col;
        int idx_up = (row - 1) * numcols + col;
        int idx_down = (row + 1) * numcols + col;
        int idx_left = row * numcols + (col - 1);
        int idx_right = row * numcols + (col + 1);

        // Preload shared data
        float x0 = input[idx_up - 1];  // leftup
        float x1 = input[idx_up];      // up
        float x2 = input[idx_up + 1];  // rightup
        float x3 = input[idx_left];    // left
        float x5 = input[idx_right];   // right
        float x6 = input[idx_down - 1]; // leftdown
        float x7 = input[idx_down];    // down
        float x8 = input[idx_down + 1]; // rightdown

        // Compute gradients
        float gradient_h = (x0 * -1) + (x2 * 1) + (x3 * -2) + (x5 * 2) + (x6 * -1) + (x8 * 1);
        float gradient_v = (x0 * -1) + (x1 * -2) + (x3 * -1) + (x6 * 1) + (x7 * 2) + (x8 * 1);

        // Use local variable for threshold comparison
        const float threshold = 30;
        float gradient = sqrt((gradient_h * gradient_h) + (gradient_v * gradient_v));

        // Threshold logic using conditional assignment
        output[idx] = (gradient >= threshold) ? 255.0f : 0.0f;
    }
}