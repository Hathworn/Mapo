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

    int y = idx / largeur; // Correct the division for y
    int x = idx % largeur; // Use modulo for x to improve accuracy

    // Check bounds for both x and y
    if (y < (end_hauteur - start_hauteur) && x < largeur && idx < largeur * (end_hauteur - start_hauteur)) {
        int cpt = 0;
        float x1 = 0.0f;
        float y1 = 0.0f;
        
        // Pre-calculate scale factors for 'a' and 'b'
        float a = 4.0f * x / largeur - 2.0f;
        float b = 4.0f * (y + start_hauteur) / hauteur - 2.0f;

        float val = 0.0f; // Initialize val to 0.0f for better precision

        // Unroll loop partially for better performance
        #pragma unroll 4
        while (cpt < N && val <= 4.0f) {
            cpt++;
            float x2 = x1 * x1 - y1 * y1 + a;
            float y2 = 2.0f * x1 * y1 + b;
            x1 = x2;
            y1 = y2;
            val = x1* x1 + y1 * y1;
        }

        A[y * largeur + x] = cpt; // Correct index calculation
    }
}