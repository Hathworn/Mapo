#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_sumterm_part(float2 * Up, float2 * Vpl, const float2 * A_t, const float* SR, const unsigned char* nonzero_midx1234s, const unsigned int N, const unsigned int M, const float SK_factor, const unsigned int NUM_NONZERO, const unsigned int NUM_MODES) {
    unsigned int full_thread_idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Calculate the index
    unsigned int Midx = full_thread_idx / N;
    unsigned int Nidx = full_thread_idx % N;
    unsigned int NM = N * M;

    if (full_thread_idx >= NM) {
        return;
    }

    // Pre-calculate the base index to reduce redundant calculations
    unsigned int baseIndex = Nidx + Midx * N;

    // Compute the tensors
    for (int i = 0; i < NUM_NONZERO; i++) {
        unsigned int midx1 = nonzero_midx1234s[i * 4] - 1;
        unsigned int midx2 = nonzero_midx1234s[1 + i * 4] - 1;
        unsigned int midx3 = nonzero_midx1234s[2 + i * 4] - 1;
        unsigned int midx4 = nonzero_midx1234s[3 + i * 4] - 1;

        // Pre-compute indices to reduce repetitive calculations
        unsigned int idx2 = baseIndex + midx2 * NM;
        unsigned int idx3 = baseIndex + midx3 * NM;
        unsigned int idx4 = baseIndex + midx4 * NM;
        unsigned int updateIndex = baseIndex + midx1 * NM;
        unsigned int vplIndex = updateIndex + midx2 * NM * NUM_MODES;

        float a = A_t[idx2].x;
        float b = A_t[idx2].y;
        float c = A_t[idx3].x;
        float d = A_t[idx3].y;
        float e = A_t[idx4].x;
        float f = A_t[idx4].y;

        // Use temporary variables to reduce the number of accesses to Up and Vpl
        float upX = Up[updateIndex].x + SK_factor * SR[i] * (a * c * e - b * d * e + a * d * f + c * b * f);
        float upY = Up[updateIndex].y + SK_factor * SR[i] * (a * d * e + c * b * e - a * c * f + b * d * f);
        float vplX = Vpl[vplIndex].x + SR[i] * (c * e + d * f);
        float vplY = Vpl[vplIndex].y + SR[i] * (d * e - c * f);

        // Assign the previously cached values back to Up and Vpl
        Up[updateIndex].x = upX;
        Up[updateIndex].y = upY;
        Vpl[vplIndex].x = vplX;
        Vpl[vplIndex].y = vplY;
    }
}