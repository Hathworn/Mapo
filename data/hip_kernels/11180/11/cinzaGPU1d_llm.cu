#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cinzaGPU1d(unsigned char *image1, unsigned char *res, int pixels) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < pixels) {
        int idx = 3 * i;
        // Load color values once into registers
        int r = image1[idx + 2];
        int g = image1[idx + 1];
        int b = image1[idx];
        
        // Compute gray scale value using integer arithmetic
        int cinza = (30 * r + 59 * g + 11 * b) / 100;
        unsigned char gray = static_cast<unsigned char>(cinza);

        // Set output values
        res[idx] = gray;
        res[idx + 1] = gray;
        res[idx + 2] = gray;
    }
}