#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

texture<float, 2, hipReadModeElementType> texRef;

//=================================
// write to texture;
//=================================
enum colors
{
RED, GREEN, BLUE, ALPHA
};

__global__ void cuke_gradient(unsigned char *surface, int width, int height, size_t pitch, float t)
{
    // Calculate unique thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if thread corresponds to a valid pixel
    if (x >= width || y >= height) return;

    // Efficiently calculate pixel pointer
    float* pixel = reinterpret_cast<float*>(surface + y * pitch) + 4 * x;

    // Write pixel data
    pixel[RED]   = x / 640.0f;    // Normalize x coordinate
    pixel[GREEN] = y / 480.0f;    // Normalize y coordinate
    pixel[BLUE]  = 0.0f;          // Constant blue value
    pixel[ALPHA] = 1.0f;          // Constant alpha value
}