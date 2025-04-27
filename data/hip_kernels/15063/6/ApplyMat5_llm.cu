#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ApplyMat5(float* input, float* output, float* matrix) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    // Loop unrolling and memory access optimization
    for (int i = 0; i < 296; ++i) {
        float total = 0.0f;

        #pragma unroll
        for (int row = 0; row < 5; ++row) {
            for (int col = 0; col < 5; ++col) {
                // Reduce index computation in loop
                total += input[id * 300 + i + 300 * row + col] * matrix[row * 5 + col];
            }
        }

        // Apply ReLU activation
        total = fmax(0.0f, total);

        // Store result in the output
        output[i + id * 296] = total;
    }
}