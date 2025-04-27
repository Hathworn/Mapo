#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif
#ifdef __cplusplus
}
#endif

__global__ void mandelbrot(int* A, const int N, const int largeur, const int hauteur, const int start_hauteur, const int end_hauteur) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    int y = idx / largeur;  // Correct calculation for y coordinate
    int x = idx % largeur;  // Use modulo for x coordinate

    if (y >= start_hauteur && y < end_hauteur) {
        // Initialize constants and variables before the loop
        int cpt = 0;
        float x1 = 0.0f, y1 = 0.0f;
        float a = 4.0f * x / largeur - 2.0f;
        float b = 4.0f * y / hauteur - 2.0f;
        float val = 0.0f;

        // Simplified loop structure, combining initialization with the condition
        do {
            x1 = x1 * x1 - y1 * y1 + a;
            y1 = 2.0f * x1 * y1 + b;
            cpt++;
            val = x1 * x1 + y1 * y1;
        } while (cpt < N && val <= 4.0f);

        A[(y - start_hauteur) * largeur + x] = cpt;  // Corrected index calculation
    }
}