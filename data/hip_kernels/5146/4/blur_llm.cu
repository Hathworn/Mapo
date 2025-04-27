#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void blur(uchar3 *input, uchar3 *output, int width, int height) {
    __shared__ int matrix[7][7];
    if (threadIdx.x < 7 && threadIdx.y < 7) {
        const int mat_init[7][7] = {
            {0, 0, 1, 2, 1, 0, 0},
            {0, 3, 13, 22, 13, 3, 0},
            {1, 3, 59, 97, 59, 13, 1},
            {2, 22, 97, 159, 97, 22, 2},
            {1, 3, 59, 97, 59, 3, 1},
            {0, 3, 13, 22, 13, 3, 0},
            {0, 0, 1, 2, 1, 0, 0}
        };
        matrix[threadIdx.x][threadIdx.y] = mat_init[threadIdx.x][threadIdx.y];
    }
    __syncthreads();
    
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    
    int tid = y * width + x;
    
    if (x >= 3 && x < width-3 && y >= 3 && y < height-3) {
        int outputTemp = 0;
        int sommeCoef = 0;
        
        for (int i = 0; i < 7; i++) {
            for (int j = 0; j < 7; j++) {
                // Streamline calculations by using register storage for input pixel
                uchar3 currPixel = input[(y-3+i)*width + (x-3+j)];
                outputTemp += currPixel.x * matrix[j][i];
                sommeCoef += matrix[j][i];
            }
        }
        // Optimize coefficient division
        output[tid].x = __float2int_rn(outputTemp / static_cast<float>(sommeCoef));
        output[tid].z = output[tid].y = output[tid].x;
    }
}