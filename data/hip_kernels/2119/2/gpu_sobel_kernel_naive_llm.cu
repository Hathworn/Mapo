#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_sobel_kernel_optimized(u_char *Source, u_char *Resultat, unsigned width, unsigned height) {
    int j = blockIdx.x * blockDim.x + threadIdx.x;
    int i = blockIdx.y * blockDim.y + threadIdx.y;
    int globalIndex = i * width + j;

    // Check bounds and avoid unnecessary computation
    if (i > 0 && i < height - 1 && j > 0 && j < width - 1) {
        int gx = Source[(i-1)*width+(j+1)] + 2*Source[i*width+(j+1)] + Source[(i+1)*width+(j+1)]
                - Source[(i-1)*width+(j-1)] - 2*Source[i*width+(j-1)] - Source[(i+1)*width+(j-1)];

        int gy = Source[(i-1)*width+(j-1)] + 2*Source[(i-1)*width+j] + Source[(i-1)*width+(j+1)]
                - Source[(i+1)*width+(j-1)] - 2*Source[(i+1)*width+j] - Source[(i+1)*width+(j+1)];

        Resultat[globalIndex] = min(255, int(sqrtf(gx * gx + gy * gy)));
    } else {
        Resultat[globalIndex] = 0;
    }
}