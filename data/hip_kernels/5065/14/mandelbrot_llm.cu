#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif
#ifdef __cplusplus
}
#endif
__global__ void mandelbrot(int* A, const int N, const int largeur, const int hauteur) {
    // Calculate global thread indices
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds
    if (y < hauteur && x < largeur) {
        int cpt = 0;
        float x1 = 0.f, y1 = 0.f, x2 = 0.f, y2 = 0.f;
        float a = 4.f * x / largeur - 2.f;
        float b = 4.f * y / hauteur - 2.f;
        
        // Calculate squared magnitude in advance
        float val = x1 * x1 + y1 * y1;
        
        // Perform iteration
        while (cpt < N && val <= 4.f) {
            cpt++;
            x2 = x1 * x1 - y1 * y1 + a;
            y2 = 2.f * x1 * y1 + b;
            x1 = x2;
            y1 = y2;
            val = x1 * x1 + y1 * y1;  // Update squared magnitude
        }
        
        // Store the result
        A[y * largeur + x] = cpt;  // Correct indexing for 2D array in flat memory
    }
}