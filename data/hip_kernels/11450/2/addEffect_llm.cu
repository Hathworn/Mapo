#include "hip/hip_runtime.h"
#include "includes.h"
#define STB_IMAGE_IMPLEMENTATION
#define STB_IMAGE_WRITE_IMPLEMENTATION

__device__ int getPosition(int x, int y, int width, int margin, int pixelPosition)
{
    return (x + (y * width)) * margin + pixelPosition;
}

__global__ void addEffect(unsigned char* output_img, unsigned char* input_img, int width, int height, int nbBlocks)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global x index
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate global y index

    if (x < width && y < height) {
        int currentIndex = getPosition(x, y, width, 3, 0);
        if ((input_img[currentIndex] + input_img[currentIndex + 1] + input_img[currentIndex + 2]) / 3 < 20) {
            output_img[currentIndex] = input_img[currentIndex];
            output_img[currentIndex + 1] = input_img[currentIndex + 1];
            output_img[currentIndex + 2] = input_img[currentIndex + 2];

            for (int i = -4; i <= 4; i++) {
                for (int j = -4; j <= 4; j++) {
                    int nx = x + i;
                    int ny = y + j;
                    if (nx >= 0 && nx < width && ny >= 0 && ny < height) {
                        int neighbourIndex = getPosition(nx, ny, width, 3, 0);
                        output_img[neighbourIndex] = 0;
                        output_img[neighbourIndex + 1] = 0;
                        output_img[neighbourIndex + 2] = 0;
                    }
                }
            }
        }
    }
}