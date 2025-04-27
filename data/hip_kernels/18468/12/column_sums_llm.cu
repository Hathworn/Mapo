#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void column_sums(const float *A, float *sums, size_t ds){
    int idx = threadIdx.x + blockDim.x * blockIdx.x;

    if (idx < ds){
        // Utilize registers for sum accumulation
        float sum = 0.0f;
        // Unroll loops for improved performance
        for (size_t i = 0; i < ds; ++i)
            sum += A[idx + ds * i];

        // Write the accumulated sum to the output
        sums[idx] = sum;
    }
}