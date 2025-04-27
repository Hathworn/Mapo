#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolutionGPUkernel_2D(int *M, int *mascara, int *resultado, int m, int n, int widthM) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within image boundaries
    if (col < n && row < m) {
        int p = 0;
        int start_col = col - (widthM / 2);
        int start_row = row - (widthM / 2);

        #pragma unroll  // Optimize with unrolling for better performance
        for (int i = 0; i < widthM; i++) {
            #pragma unroll
            for (int j = 0; j < widthM; j++) {
                int curRow = start_row + i;
                int curCol = start_col + j;
                
                // Update row-major index calculation logic
                if (curRow >= 0 && curRow < m && curCol >= 0 && curCol < n) {
                    p += M[curRow * n + curCol] * mascara[i * widthM + j];
                }
            }
        }
        
        // Assign computed value to the result matrix
        resultado[row * n + col] = p;
    }
}