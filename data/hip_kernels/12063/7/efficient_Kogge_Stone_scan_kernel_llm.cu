#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void efficient_Kogge_Stone_scan_kernel(float *X, float *Y, int InputSize) {
    __shared__ float XY[SECTION_SIZE];
    __shared__ float AUS[BLOCK_DIM];

    // Coalesced load of input into shared memory
    int tid = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + tid;
    int stride = blockDim.x;

    for (int j = 0; j < SECTION_SIZE; j += stride) {
        int shared_idx = tid + j;
        if (shared_idx < InputSize) {
            XY[shared_idx] = X[idx + j];
        }
    }
    __syncthreads();

    // PHASE 1: Inclusive scan within each thread's subsection
    for (int j = 1; j < SUBSECTION_SIZE; j++) {
        int subsection_idx = tid * SUBSECTION_SIZE + j;
        XY[subsection_idx] += XY[subsection_idx - 1];
    }
    __syncthreads();

    // PHASE 2: Iteratively Kogge-Stone scan across subsections
    AUS[tid] = XY[tid * SUBSECTION_SIZE + SUBSECTION_SIZE - 1];
    float in;
    for (unsigned int s = 1; s < stride; s *= 2) {
        __syncthreads();
        if (tid >= s) {
            in = AUS[tid - s];
        }
        __syncthreads();
        if (tid >= s) {
            AUS[tid] += in;
        }
    }
    __syncthreads();

    // PHASE 3: Add scanned results to each subsection
    if (tid > 0) {
        float offset = AUS[tid - 1];
        for (unsigned int j = 0; j < SUBSECTION_SIZE; j++) {
            XY[tid * SUBSECTION_SIZE + j] += offset;
        }
    }
    __syncthreads();

    // Store results into output
    for (int j = 0; j < SECTION_SIZE; j += stride) {
        int shared_idx = tid + j;
        if (shared_idx < InputSize) {
            Y[idx + j] = XY[shared_idx];
        }
    }
}