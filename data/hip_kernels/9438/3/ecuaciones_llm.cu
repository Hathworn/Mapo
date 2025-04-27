#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ecuaciones(int a, int b, int c, float *sol) {
    // Utilize blockIdx.x and blockDim.x for parallel processing
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    float d = 0;
    float x = 0, y = 0;

    // Precompute 2*a once for reuse
    float two_a = 2.0f * a;

    d = b * b - 4 * a * c;
    if (d > 0) {
        // Compute sqrt(d) once for reuse
        float sqrt_d = sqrt(d);
        x = (-b + sqrt_d) / two_a;
        y = (-b - sqrt_d) / two_a;
        sol[index * 2] = x; // Store results in consecutive memory locations
        sol[index * 2 + 1] = y;
    }
    else if (d == 0) {
        x = (-b) / two_a;
        sol[index * 2] = x; // Ensure consistent memory access pattern
    }
}