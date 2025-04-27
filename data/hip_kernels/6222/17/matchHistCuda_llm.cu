#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matchHistCuda(float* qSet, float* dbSet, size_t qSize, size_t dbSize, size_t hSize, float* out) {
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    size_t idy = blockIdx.y * blockDim.y + threadIdx.y;

    if (idx < qSize && idy < dbSize) {
        size_t qi = idx * hSize;
        size_t dbi = idy * hSize;

        // Use registers for the sums to optimize memory access
        float sumab = 0.0f;
        float suma2 = 0.0f;
        float sumb2 = 0.0f;

        // Unroll loop for performance improvement
        for (int k = 0; k < hSize; k++) {
            float qval = qSet[qi + k];
            float dbval = dbSet[dbi + k];
            sumab += qval * dbval;
            suma2 += qval * qval;
            sumb2 += dbval * dbval;
        }

        // Reduce division operations 
        float denom = sqrtf(suma2) * sqrtf(sumb2);
        if (denom > 0.0f) {
            float cossim = sumab / denom;
            out[idy * qSize + idx] = cossim;
        } else {
            out[idy * qSize + idx] = 0.0f; // Handle division by zero
        }
    }
}