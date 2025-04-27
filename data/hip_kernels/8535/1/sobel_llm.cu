#include "hip/hip_runtime.h"
#include "includes.h"

typedef enum color {BLUE, GREEN, RED} Color;

__global__ void sobel(unsigned char *src, unsigned char *dest, int width, int heigth, int step, int channels) {

    // Compute global row and column indices
    int ren = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check for boundary conditions
    if (ren < 1 || col < 1 || ren >= heigth-1 || col >= width-1) return;

    // Sobel operator kernels
    int gx[3][3] = {{-1, 0, 1}, {-2, 0, 2}, {-1, 0, 1}};
    int gy[3][3] = {{1, 2, 1}, {0, 0, 0}, {-1, -2, -1}};

    // Iterating over each color channel
    for (int c = 0; c < 3; c++) {
        int tmp_ren = 0;
        int tmp_col = 0;
        
        // Convolution operation
        for (int i = -1; i <= 1; i++) {
            for (int j = -1; j <= 1; j++) {
                int pixel = src[((ren + i) * step) + ((col + j) * channels) + c];
                tmp_ren += pixel * gx[i + 1][j + 1];
                tmp_col += pixel * gy[i + 1][j + 1];
            }
        }
        
        // Store result in destination image
        dest[(ren * step) + (col * channels) + c] = (unsigned char) sqrtf(tmp_col * tmp_col + tmp_ren * tmp_ren);
    }
}