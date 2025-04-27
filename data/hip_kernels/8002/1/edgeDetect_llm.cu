#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void edgeDetect(unsigned char* device_input_data, unsigned char* device_output_data, int height, int width) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    //check bounds
    if (x < 1 || x > width - 2 || y < 1 || y > height - 2)
        return;

    //for horizontal lines
    const int fmat_x[3][3] = {
        {-1, 0, 1},
        {-2, 0, 2},
        {-1, 0, 1}
    };
    // for vertical lines
    const int fmat_y[3][3]  = {
        {-1, -2, -1},
        {0,   0,  0},
        {1,   2,  1}
    };

    double G_x = 0;
    double G_y = 0;

    //go through rows and cols
    for (int i = -1; i <= 1; ++i) {
        for (int j = -1; j <= 1; ++j) {
            G_x += (double)(fmat_x[i + 1][j + 1] * device_input_data[(y + i) * width + (x + j)]);
            G_y += (double)(fmat_y[i + 1][j + 1] * device_input_data[(y + i) * width + (x + j)]);
        }
    }

    int G = sqrt(G_x * G_x + G_y * G_y);

    // Clamp the value to [0, 255]
    if (G > 255)
        G = 255;

    device_output_data[y * width + x] = G;
}