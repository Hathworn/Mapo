```c
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

__global__ void kernGradient(int N, int width, int height, unsigned char * in, unsigned char * gradient, unsigned char * edgeDir, float * G_x, float * G_y) {
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    if (x >= width || y >= height) return;
    
    int idx = y * width + x;
    float Gx = 0.0f, Gy = 0.0f;
    
    // Use shared memory to reduce global memory access latency
    __shared__ unsigned char shared_in[32][32];
    int local_x = threadIdx.x + 1;
    int local_y = threadIdx.y + 1;
    
    shared_in[local_y][local_x] = in[idx];
    if (threadIdx.x == 0 && x > 0) {
        shared_in[local_y][0] = in[idx - 1];
    }
    if (threadIdx.x == blockDim.x - 1 && x < width - 1) {
        shared_in[local_y][blockDim.x + 1] = in[idx + 1];
    }
    if (threadIdx.y == 0 && y > 0) {
        shared_in[0][local_x] = in[idx - width];
    }
    if (threadIdx.y == blockDim.y - 1 && y < height - 1) {
        shared_in[blockDim.y + 1][local_x] = in[idx + width];
    }
    __syncthreads();
    
    // Compute Gx and Gy using shared memory
    for (int dy = -1; dy <= 1; dy++) {
        for (int dx = -1; dx <= 1; dx++) {
            Gx += shared_in[local_y + dy][local_x + dx] * G_x[(dy + 1) * 3 + (dx + 1)];
            Gy += shared_in[local_y + dy][local_x + dx] * G_y[(dy + 1) * 3 + (dx + 1)];
        }
    }
    
    float grad = sqrtf(Gx * Gx + Gy * Gy);
    float angle = atan2f(Gy, Gx) * (180.0f / 3.14159f);
    
    unsigned char roundedAngle;
    if (((-22.5 < angle) && (angle <= 22.5)) || ((157.5 < angle) || (angle <= -157.5))) {
        roundedAngle = 0;
    } else if (((-157.5 < angle) && (angle <= -112.5)) || ((22.5 < angle) && (angle <= 67.5))) {
        roundedAngle = 45;
    } else if (((-112.5 < angle) && (angle <= -67.5)) || ((67.5 < angle) && (angle <= 112.5))) {
        roundedAngle = 90;
    } else {
        roundedAngle = 135;
    }
    
    gradient[idx] = grad;
    edgeDir[idx] = roundedAngle;
}