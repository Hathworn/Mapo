#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculoAlgoritmoTroca(float *dev_matrizSuperior, int linhaPerm, int colunaPerm, int totalColunas, int totalLinhas)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Early exit for invalid or permissible row indices
    if (i >= totalLinhas || i == linhaPerm)
        return;

    float fatorAnulador = dev_matrizSuperior[i * totalColunas + colunaPerm] * (-1);

    // Calculate only valid elements within the row
    for (int coluna = 0; coluna < totalColunas; coluna++) {
        // Skip invalid memory access
        if (i * totalColunas + coluna >= totalLinhas * totalColunas)
            return;

        if (coluna == colunaPerm) {
            dev_matrizSuperior[i * totalColunas + coluna] = 0;
        } else {
            dev_matrizSuperior[i * totalColunas + coluna] = fatorAnulador
                * dev_matrizSuperior[linhaPerm * totalColunas + coluna]
                + dev_matrizSuperior[i * totalColunas + coluna];
        }
    }
}