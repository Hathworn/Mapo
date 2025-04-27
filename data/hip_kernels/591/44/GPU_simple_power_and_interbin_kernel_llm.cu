```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GPU_simple_power_and_interbin_kernel(float2 *d_input_complex, float *d_output_power, float *d_output_interbinning, int nTimesamples, float norm) {
    int pos_x = blockIdx.x * blockDim.x + threadIdx.x;
    int pos_y = blockIdx.y * ((nTimesamples >> 1) + 1);

    if (pos_x >= (nTimesamples >> 1)) return; // Exit early if outside range

    float2 A = d_input_complex[pos_y + pos_x];
    A.x /= norm; // Normalize A
    A.y /= norm;

    d_output_power[blockIdx.y * (nTimesamples >> 1) + pos_x] = A.x * A.x + A.y * A.y;
    d_output_interbinning[blockIdx.y * nTimesamples + 2 * pos_x] = A.x * A.x + A.y * A.y;

    if (pos_x > 0) {
        float2 B = d_input_complex[pos_y + pos_x + 1];
        B.x /= norm; // Normalize B
        B.y /= norm;

        d_output_interbinning[blockIdx.y * nTimesamples + 2 * pos_x + 1] = 0.616850275f * ((A.x - B.x) * (A.x - B.x) + (A.y - B.y) * (A.y - B.y));
    }
}