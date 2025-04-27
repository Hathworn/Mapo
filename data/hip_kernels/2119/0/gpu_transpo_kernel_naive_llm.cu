#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_transpo_kernel_naive(u_char *Source, u_char *Resultat, unsigned width, unsigned height) {
    // Calculate global column and row indices
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;

    // Check within bounds and perform operation
    if (i < height && j < width) {
        Resultat[j * height + i] = Source[i * width + j];
    }
}