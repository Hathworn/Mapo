#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smoothGray(unsigned char *imagem, unsigned char *saida, unsigned int cols, unsigned int linhas)
{
    // Calculate the linear index for the current thread
    unsigned int indice = (blockIdx.y * blockDim.y * cols) + (blockIdx.x * blockDim.x) + threadIdx.x;
    if (indice >= cols * linhas)
        return;

    // Calculate bounds for the smoothing window
    int i_begin = (indice / cols) - 2;
    int i_end = (indice / cols) + 2;
    int j_begin = (indice % cols) - 2;
    int j_end = (indice % cols) + 2;

    // Ensure indices are within the image boundaries
    i_begin = max(i_begin, 0);
    j_begin = max(j_begin, 0);
    i_end = min(i_end, linhas - 1);  // Correct the boundary check
    j_end = min(j_end, cols - 1);

    // Calculate the average value in the window
    int media = 0;
    int qtd = 0;
    for (int i = i_begin; i <= i_end; ++i)
    {
        for (int j = j_begin; j <= j_end; ++j)
        {
            media += imagem[(i * cols) + j];
            qtd++;
        }
    }
    saida[indice] = (unsigned char)(media / qtd);
}