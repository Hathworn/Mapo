#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fsc_tomo_cmp_kernal(const float* __restrict__ data1, const float* __restrict__ data2, float* __restrict__ device_soln, const float data1threshold, const float data2threshold, const int nx, const int ny, const int nz, const int offset)
{
    const uint x = threadIdx.x;
    const uint y = blockIdx.x;

    int idx = x + y * MAX_THREADS + offset;
    float sum_data1_amps = 0.0f;
    float sum_data2_amps = 0.0f;
    float top = 0.0f;

    for (int i = 0; i < ny; i++)
    {
        // Calculate indices for real and imaginary parts
        int base_idx = 2 * (idx % nx / 2) + (2 * idx / nx) * ny * nz + i * nx;
        int rindex = base_idx;
        int iindex = base_idx + 1;

        // Load data
        float data1_r = data1[rindex];
        float data1_i = data1[iindex];
        float data2_r = data2[rindex];
        float data2_i = data2[iindex];

        // Compute magnitudes
        float data1_mag2 = data1_r * data1_r + data1_i * data1_i;
        float data2_mag2 = data2_r * data2_r + data2_i * data2_i;

        // Threshold check
        if (data1_mag2 > data1threshold && data2_mag2 > data2threshold)
        {
            sum_data1_amps += data1_mag2;
            sum_data2_amps += data2_mag2;
            top += (data1_r * data2_r + data1_i * data2_i);
        }
    }

    // Store results
    device_soln[idx * 3] = top;
    device_soln[idx * 3 + 1] = sum_data1_amps;
    device_soln[idx * 3 + 2] = sum_data2_amps;
}