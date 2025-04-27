```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum4Man(float *A, float *B, float *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid executing out-of-bounds memory accesses
    if (i >= N) return;

    float x[4], a[4], b[4], c[4];

    #pragma unroll
    for (int j = 0; j < 4; ++j) {
        a[j] = A[i];
        b[j] = B[i];
        x[j] = a[j] / 7.0f;
        c[j] = a[j] / 3 + 20 * b[j]; // 17*b[j] + 3*b[j] simplified to 20*b[j]
        x[j] *= a[j]; // Move repeated expression out of loop

        if (j < 3) {
            i += blockDim.x * gridDim.x;
            if (i >= N) break; // Exit loop if out of bounds
        }
    }

    i = blockIdx.x * blockDim.x + threadIdx.x;
    C[i] += c[0] - x[0];

    i += blockDim.x * gridDim.x;
    if (i < N) C[i] += c[1] - x[1];

    i += blockDim.x * gridDim.x;
    if (i < N) C[i] += c[2] - x[2];

    i += blockDim.x * gridDim.x;
    if (i < N) C[i] += c[3] - x[3];
}