```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shared4R40ops(float *A, float *B, float *C, const int N)
{
    __shared__ float Smem[512];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < N)
        Smem[threadIdx.x] = A[i];
    __syncthreads();

    if (i < N) {
        float a = A[i];
        float b = B[i];
        float t1 = tan(0.2f);
        float t2 = tan(0.3f);
        float t3 = tan(0.1f);
        float t4 = tan(0.5f);

        // Precompute constants and commonly used subexpressions
        float temp1 = t1 * t2;
        float temp2 = b / 4.0f;
        float temp3 = a * b / 3.0f;
        float temp4 = t3 * a;
        float temp5 = t4 * b;
        
        float x = temp1 + temp2 + temp3 + temp4 + temp5;
        x += a / 3.0f + 20.0f * b - a * a - 4.0f * temp3 + 7.0f * b * b;
        
        // Use registers for shared memory access
        float s1 = Smem[(threadIdx.x + 1) % 512];
        float s2 = Smem[(threadIdx.x + 2) % 512];
        float s3 = Smem[(threadIdx.x + 3) % 512];
        float s4 = Smem[(threadIdx.x + 4) % 512];
        
        C[i] = x - 8.0f + s1 * a + 4.0f * s2 + 3.0f * b * s3 + a * s4;
    }
}