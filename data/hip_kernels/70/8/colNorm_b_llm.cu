#include "hip/hip_runtime.h"
#include "includes.h"
/***********************************************************
By Huahua Wang, the University of Minnesota, twin cities
***********************************************************/


__global__ void colNorm_b(float* X, float* v, float* b, unsigned int size, unsigned int n) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    for (unsigned long int i = idx; i < size; i += stride) {
        unsigned int col = i % n; // Simplified calculation of column index
        float normalizationFactor = v[col] * b[col]; // Precompute normalization factor
        X[i] /= normalizationFactor; // Use precomputed factor for division
    }
}