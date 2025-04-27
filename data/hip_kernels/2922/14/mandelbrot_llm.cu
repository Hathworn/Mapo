#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif
#ifdef __cplusplus
}
#endif

// Optimize memory access by using shared memory for largeur and hauteur.
__global__ void mandelbrot(int* A, const int N, const int largeur, const int hauteur) {
    __shared__ int shared_largeur, shared_hauteur;
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_largeur = largeur;
        shared_hauteur = hauteur;
    }
    __syncthreads();

    int y = threadIdx.y + (blockIdx.y * blockDim.y);
    int x = threadIdx.x + (blockIdx.x * blockDim.x);

    if (y < shared_hauteur && x < shared_largeur) {
        int cpt = 0;
        float x1 = 0.f;
        float y1 = 0.f;
        float x2 = 0.f;
        float y2 = 0.f;

        // Precompute constants for efficiency
        float scaled_x = 4.f / shared_largeur * x - 2.f;
        float scaled_y = 4.f / shared_hauteur * y - 2.f;

        float val = x1 * x1 + y1 * y1;

        while (cpt < N && val <= 4.f) {
            cpt++;
            x2 = x1 * x1 - y1 * y1 + scaled_x;
            y2 = 2.f * x1 * y1 + scaled_y;
            x1 = x2;
            y1 = y2;
            val = x1 * x1 + y1 * y1;
        }

        A[y * shared_hauteur + x] = cpt;
    }
}