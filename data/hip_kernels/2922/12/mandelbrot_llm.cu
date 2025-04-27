```c
#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus
}
#endif
__global__ void mandelbrot(int* A, const int N, const int largeur, const int hauteur){
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    if (idx >= largeur * hauteur) return; // Early exit if index is out of bounds

    int x = idx % largeur;   // Use modulo for x
    int y = idx / largeur;   // Calculate y based on index

    int cpt = 0;
    float x1 = 0.0f;
    float y1 = 0.0f;
    float x2 = 0.0f;
    float y2 = 0.0f;
    float a = 4.0f * x / largeur - 2.0f;
    float b = 4.0f * y / hauteur - 2.0f;

    float val = x1 * x1 + y1 * y1;

    while (cpt < N && val <= 4.0f) {
        cpt++;
        x2 = x1 * x1 - y1 * y1 + a;
        y2 = 2.0f * x1 * y1 + b;
        x1 = x2;
        y1 = y2;
        val = x1 * x1 + y1 * y1;
    }

    A[y * largeur + x] = cpt; // Correct index for row-major order storage
}