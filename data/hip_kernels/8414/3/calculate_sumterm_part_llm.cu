#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculate_sumterm_part(double2* Up, double2* Vpl, const double2* A_t, const double* SR, const unsigned char* nonzero_midx1234s, const unsigned int N, const unsigned int M, const double SK_factor, const unsigned int NUM_NONZERO, const unsigned int NUM_MODES) {
    unsigned int full_thread_idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int NM = N * M;

    // Early exit if out of bounds
    if (full_thread_idx >= NM) {
        return;
    }

    // Calculate index
    unsigned int Midx = full_thread_idx / N;
    unsigned int Nidx = full_thread_idx % N;

    // Compute the tensors
    for (int i = 0; i < NUM_NONZERO; ++i) {
        unsigned int midx1 = nonzero_midx1234s[i * 4] - 1;
        unsigned int midx2 = nonzero_midx1234s[1 + i * 4] - 1;
        unsigned int midx3 = nonzero_midx1234s[2 + i * 4] - 1;
        unsigned int midx4 = nonzero_midx1234s[3 + i * 4] - 1;

        unsigned int idx2 = Nidx + Midx * N + midx2 * NM;
        unsigned int idx3 = Nidx + Midx * N + midx3 * NM;
        unsigned int idx4 = Nidx + Midx * N + midx4 * NM;

        double a = A_t[idx2].x;
        double b = A_t[idx2].y;
        double c = A_t[idx3].x;
        double d = A_t[idx3].y;
        double e = A_t[idx4].x;
        double f = A_t[idx4].y;

        unsigned int idx1 = Nidx + Midx * N + midx1 * NM;
        double2 tempUp = Up[idx1];
        
        // Update Up
        tempUp.x += SK_factor * SR[i] * (a * c * e - b * d * e + a * d * f + c * b * f);
        tempUp.y += SK_factor * SR[i] * (a * d * e + c * b * e - a * c * f + b * d * f);
        Up[idx1] = tempUp;

        // Update Vpl
        unsigned int idxVpl = idx1 + midx2 * NM * NUM_MODES;
        double2 tempVpl = Vpl[idxVpl];
        tempVpl.x += SR[i] * (c * e + d * f);
        tempVpl.y += SR[i] * (d * e - c * f);
        Vpl[idxVpl] = tempVpl;
    }
}