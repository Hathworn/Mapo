#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void polynomial_expansion(float* poly, int degree, int n, float* array) {
    // Calculate index using block and thread identifiers
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < n) {
        float out = 0.0;
        float xtothepowerof = 1.0;

        // Loop to compute polynomial expansion
        for (int x = 0; x <= degree; ++x) {
            out += xtothepowerof * poly[x];
            
            // Inline multiplication to reduce redundancy
            xtothepowerof *= array[index];
        }

        // Store result into the array
        array[index] = out;
    }
}