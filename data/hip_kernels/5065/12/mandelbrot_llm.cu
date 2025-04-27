#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef __cplusplus
extern "C" {
#endif



#ifdef __cplusplus
}
#endif
__global__ void mandelbrot(int* A, const int N, const int largeur, const int hauteur) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    int total_pixels = largeur * hauteur;

    // Ensure idx does not exceed total number of pixels
    if (idx < total_pixels) {
        int y = idx / largeur; // Correct computation of y coordinate
        int x = idx % largeur; // Correct computation of x coordinate

        int cpt = 0;
        float x1 = 0.;
        float y1 = 0.;

        float a = 4.0f * x / largeur - 2.0f;
        float b = 4.0f * y / hauteur - 2.0f;

        float val = 0.0f;

        // Unroll the loop for potential performance improvement
        #pragma unroll
        while (cpt < N && val <= 4.0f) {
            cpt++;
            float x2 = x1 * x1 - y1 * y1 + a;
            y1 = 2.0f * x1 * y1 + b;
            x1 = x2;
            val = x1 * x1 + y1 * y1;
        }

        A[y * largeur + x] = cpt; // Correct storage location in output array
    }
}