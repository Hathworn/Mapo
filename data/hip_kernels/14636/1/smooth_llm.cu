#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth(unsigned char *entrada, unsigned char *saida, int n_linhas, int n_colunas) {
    int posicao = blockIdx.x * blockDim.x + threadIdx.x;
    if (posicao < n_linhas * n_colunas) {
        int sum = 0;
        int row, col;
        
        // Efficiently sum the 5x5 region using loops
        for (int i = 0; i < 5; ++i) {
            for (int j = 0; j < 5; ++j) {
                row = posicao / n_colunas + i;  // Calculate current row
                col = posicao % n_colunas + j;  // Calculate current column

                // Add boundary check to avoid out-of-bounds accesses
                if (row < n_linhas && col < n_colunas) {
                    sum += entrada[row * n_colunas + col];
                }
            }
        }

        // Calculate the average
        saida[posicao] = sum / 25;
    }
}