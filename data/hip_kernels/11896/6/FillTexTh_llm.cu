#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void FillTexTh(void *surface, int width, int height, size_t pitch, double* src, int Mask, int th, int pixValue)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= width || y >= height) return;

    unsigned char *pixel1 = (unsigned char *)((char*)surface + y * pitch) + 4 * x;

    double w = src[x + width*y];
    w = fminf(fmaxf(w, 0.0), 253.0); // Optimize w clamping using intrinsic functions

    if (pixel1[3] >= th) {
        for (int i = 0; i < 3; i++) {
            if (Mask & (1 << i)) pixel1[i] = static_cast<unsigned char>(w); // Simplified conversion to unsigned char
        }
    } else {
        for (int i = 0; i < 3; i++) {
            if (Mask & (1 << i)) pixel1[i] = static_cast<unsigned char>(pixValue >> (i * 8)); // Simplified conversion to unsigned char
        }
    }
}