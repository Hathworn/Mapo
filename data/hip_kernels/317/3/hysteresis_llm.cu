#include "hip/hip_runtime.h"
#include "includes.h"

#define UPPERTHRESHOLD 90
#define LOWERTHRESHOLD 30

const float G_x[3 * 3] = {
-1, 0, 1,
-2, 0, 2,
-1, 0, 1
};

const float G_y[3 * 3] = {
1, 2, 1,
0, 0, 0,
-1, -2, -1
};

const float gaussian[5 * 5] = {
2.f/159, 4.f/159, 5.f/159, 4.f/159, 2.f/159,
4.f/159, 9.f/159, 12.f/159, 9.f/159, 4.f/159,
5.f/159, 12.f/159, 15.f/159, 12.f/159, 2.f/159,
4.f/159, 9.f/159, 12.f/159, 9.f/159, 4.f/159,
2.f/159, 4.f/159, 5.f/159, 4.f/159, 2.f/159
};

__global__ void hysteresis(int N, int width, int height, unsigned char *in) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x >= width || y >= height) {
        return; // Return if out of bounds
    }
    int idx = y * width + x;
    if (in[idx] > UPPERTHRESHOLD) {
        in[idx] = 255;
        return; // Directly return if above threshold
    } else if (in[idx] < LOWERTHRESHOLD) {
        in[idx] = 0;
        return; // Directly return if below threshold
    }
    // Use shared memory for neighbor pixel values
    __shared__ unsigned char local[3][3];
    for (int dy = -1; dy <= 1; dy++) {
        for (int dx = -1; dx <= 1; dx++) {
            int nx = x + dx;
            int ny = y + dy;
            if (0 <= nx && nx < width && 0 <= ny && ny < height) {
                local[dy+1][dx+1] = in[ny * width + nx]; // Load into shared memory
            } else {
                local[dy+1][dx+1] = 0; // Boundary condition
            }
        }
    }
    __syncthreads(); // Ensure all threads have loaded their pixel values
    
    // Check neighbors in shared memory
    for (int dy = -1; dy <= 1; dy++) {
        for (int dx = -1; dx <= 1; dx++) {
            if (local[dy+1][dx+1] > LOWERTHRESHOLD) {
                in[idx] = 255;
                return; // Break out once a valid neighbor is found
            }
        }
    }
}