#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define GAUSS_WIDTH 5
#define SOBEL_WIDTH 3

typedef struct images {
char *pType;
int width;
int height;
int maxValColor;
unsigned char *data;
} image;

__global__ void applyGaussianFilter(unsigned char *input, unsigned char *output, float *kernel, int iHeight, int iWidth, int kWidth) {

    // Calculate global position
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Ensure within image bounds
    if (x >= iWidth || y >= iHeight) return;

    double sum = 0.0;
    int halvedKW = kWidth / 2;

    // Optimization: Use constant memory if kernel size is fixed
    __shared__ float shKernel[GAUSS_WIDTH * GAUSS_WIDTH];

    if (threadIdx.x < kWidth && threadIdx.y < kWidth) {
        shKernel[threadIdx.y * kWidth + threadIdx.x] = kernel[threadIdx.y * kWidth + threadIdx.x];
    }
    __syncthreads();

    // Apply filter
    for (int i = -halvedKW; i <= halvedKW; i++) {
        for (int j = -halvedKW; j <= halvedKW; j++) {
            int nx = x + j;
            int ny = y + i;
            if (nx >= 0 && nx < iWidth && ny >= 0 && ny < iHeight) {
                int kPosX = j + halvedKW;
                int kPosY = i + halvedKW;
                sum += input[ny * iWidth + nx] * shKernel[kPosY * kWidth + kPosX];
            }
        }
    }

    // Clamp to max value
    if (sum > 255.0) sum = 255.0;

    // Write output
    output[y * iWidth + x] = (unsigned char)sum;
}