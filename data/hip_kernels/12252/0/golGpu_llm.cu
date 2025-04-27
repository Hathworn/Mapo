#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void golGpu(int height, int width, unsigned char* pBuffer1, unsigned char* pBuffer2) {
    // Calculate global thread x and y position
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within the bounds
    if(x < height && y < width) { 
        int indx = x * width + y;

        pBuffer2[indx] = pBuffer1[indx];

        int num = 0;
        
        // Loop to calculate live neighbors
        for(int dx = -1; dx <= 1; ++dx) {
            for(int dy = -1; dy <= 1; ++dy) {
                if(dx != 0 || dy != 0) { // Exclude the cell itself
                    int nx = x + dx;
                    int ny = y + dy;
                    if(nx >= 0 && nx < height && ny >= 0 && ny < width) {
                        num += pBuffer1[nx * width + ny];
                    }
                }
            }
        }

        // Apply the rules of the Game of Life
        if(num < 2 || num > 3) 
            pBuffer2[indx] = 0x0;
        else if(num == 3) 
            pBuffer2[indx] = 0x1;
    }
}