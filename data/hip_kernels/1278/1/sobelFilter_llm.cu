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

// Optimize index calculation
int col = threadIdx.x + blockIdx.x * blockDim.x;
int row = threadIdx.y + blockIdx.y * blockDim.y;
int numcols = WIDTH;

// Initialize gradients and threshold
float gradient_h = 0.0f;
float gradient_v = 0.0f;
const float thresh = 30.0f;

// Avoid out-of-bound errors
if (row < height && col < width && row > 0 && col > 0)
{
int x0 = input[(row - 1) * numcols + (col - 1)]; // leftup
int x1 = input[(row - 1) * numcols + col];       // up
int x2 = input[(row - 1) * numcols + (col + 1)]; // rightup
int x3 = input[row * numcols + (col - 1)];       // left
int x5 = input[row * numcols + (col + 1)];       // right
int x6 = input[(row + 1) * numcols + (col - 1)]; // leftdown
int x7 = input[(row + 1) * numcols + col];       // down
int x8 = input[(row + 1) * numcols + (col + 1)]; // rightdown

// Calculate gradients
gradient_h = (x0 * -1.0f) + (x2 * 1.0f) + (x3 * -2.0f) + (x5 * 2.0f) + (x6 * -1.0f) + (x8 * 1.0f);
gradient_v = (x0 * -1.0f) + (x1 * -2.0f) + (x3 * -1.0f) + (x6 * 1.0f) + (x7 * 2.0f) + (x8 * 1.0f);

// Use hypotf for better performance
float gradient = hypotf(gradient_h, gradient_v);

// Binarize the gradient
output[row * numcols + col] = (gradient >= thresh) ? 255.0f : 0.0f;
}
}