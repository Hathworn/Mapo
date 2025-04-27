#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

typedef unsigned char byte;

unsigned greyScale(char* str, byte*& image, byte*& pixels, unsigned int& width, unsigned int& height);
unsigned writeImage(byte*& image, unsigned int& width, unsigned int& height, char* str);
void sobel(byte*& image, byte*& edged, unsigned int& width, unsigned int& height);
void sobelOpenMP(byte*& image, byte*& edged, unsigned int& width, unsigned int& height);

__global__ void sobelCuda(byte* image, byte* edged, int width, int height) {
    // Calculate the x and y coordinates of the pixel
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int j = x / width;
    int i = x % width;

    // Check boundary conditions
    if (i < 1 || i >= (width - 1) || j < 1 || j >= (height - 1))
        return;

    // Precompute indices for efficiency
    int index = i + j * width;
    int idx1 = index - 1;
    int idx3 = index + 1;
    int idx4 = index - width;
    int idx5 = index + width;
    int idx2 = idx4 - 1;
    int idx6 = idx4 + 1;
    int idx7 = idx5 - 1;
    int idx8 = idx5 + 1;

    // Compute gradient in X direction
    int gX = -image[idx2] - 2 * image[idx4] - image[idx6]
             + image[idx7] + 2 * image[idx5] + image[idx8];

    // Compute gradient in Y direction
    int gY = -image[idx2] + image[idx6]
             - 2 * image[idx1] + 2 * image[idx3]
             - image[idx7] + image[idx8];

    // Compute the edge intensity and clamp to 255
    edged[index] = (byte)min(sqrt((float)(gX * gX) + (gY * gY)), 255.0f);
}