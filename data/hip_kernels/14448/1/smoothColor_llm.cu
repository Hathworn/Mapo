#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smoothColor(unsigned char *imagem, unsigned char *saida, unsigned int cols, unsigned int linhas) 
{
    unsigned int indice = blockIdx.y * blockDim.x * gridDim.x + blockIdx.x * blockDim.x + threadIdx.x; // corrected index calculation
    if (indice >= cols * linhas)
        return;

    // Compute starting and ending indices for the smoothing window
    int i = indice / cols;
    int j = indice % cols;

    int i_begin = max(i - 2, 0);
    int i_end = min(i + 2, linhas - 1);
    int j_begin = max(j - 2, 0);
    int j_end = min(j + 2, cols - 1);

    // Initialize smoothing variables
    int media[3] = {0, 0, 0};
    int qtd = 0;

    for (int ii = i_begin; ii <= i_end; ++ii) 
    {
        for (int jj = j_begin; jj <= j_end; ++jj) 
        {
            // Accumulate pixel values
            media[0] += imagem[((ii * cols) + jj) * 3];
            media[1] += imagem[((ii * cols) + jj) * 3 + 1];
            media[2] += imagem[((ii * cols) + jj) * 3 + 2];
            qtd++;
        }
    }

    // Compute the average and store in the output
    saida[indice * 3] = (unsigned char)(media[0] / qtd);
    saida[indice * 3 + 1] = (unsigned char)(media[1] / qtd);
    saida[indice * 3 + 2] = (unsigned char)(media[2] / qtd);
}