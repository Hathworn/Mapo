#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_calculation(float* a, int* indeces, float* b, float* x, float* r, int size) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for storing intermediate values to improve memory access speed
    __shared__ float shared_a[3];
    __shared__ int shared_indices[3];
    __shared__ float shared_x[3];

    if (index < size) {
        float sum = 0;

        // Unrolling the loop to reduce overhead and increase parallel execution
        #pragma unroll
        for (int i = 0; i < 3; i++) {
            shared_a[i] = a[3 * index + i];
            shared_indices[i] = indeces[3 * index + i];
            shared_x[i] = x[shared_indices[i]];
            sum += shared_a[i] * shared_x[i];
        }

        r[index] = b[index] - sum;
    }
}