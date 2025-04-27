#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_calculation(float c0r, float c0i, float float_step, float imag_step, int *results, unsigned n, int W, int H, int inicial) {
    // Calculate global index using block and thread identifiers
    const long unsigned globalIndex = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if globalIndex is within bounds
    if (globalIndex < n) {
        // Determine coordinates for the complex plane
        int x = (globalIndex + inicial) / W;
        int y = (globalIndex + inicial) % H;

        // Calculate the real and imaginary parts of the complex number
        float point_r = c0r + x * float_step;
        float point_i = c0i + y * imag_step;

        const int M = 1000; // Maximum iterations
        int j = -1; // -1 indicates no failure in mandelbrot computation

        // Initial values for Mandelbrot computation
        float old_r = 0.0f; // Current real part
        float old_i = 0.0f; // Current imaginary part

        // Perform Mandelbrot iteration
        for (int i = 1; i <= M; i++) {
            // Update real and imaginary parts
            float aux = (old_r * old_r) - (old_i * old_i) + point_r;
            old_i = (2.0f * old_r * old_i) + point_i;
            old_r = aux;

            // Check if the modulus exceeds 2 (optimizing condition check)
            if ((old_r * old_r + old_i * old_i) > 4.0f) {
                j = i;
                break;
            }
        }

        // Store the result for the current complex number
        results[globalIndex] = j;
    }
}