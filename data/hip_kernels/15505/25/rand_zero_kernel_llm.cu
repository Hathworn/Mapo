#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rand_zero_kernel(float *data, int n, float p, hiprandStatePhilox4_32_10_t *states) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;

    // Only perform operations if x is less than n to avoid unnecessary calculations
    if (x < n) {
        hiprandStatePhilox4_32_10_t &state = states[x];
        x *= 4;

        // Unroll loop manually for potential performance gain
        float4 vals = hiprand_uniform4(&state);
        if (reinterpret_cast<float*>(&vals)[0] < p && (x + 0) < n) data[x + 0] = 0;
        if (reinterpret_cast<float*>(&vals)[1] < p && (x + 1) < n) data[x + 1] = 0;
        if (reinterpret_cast<float*>(&vals)[2] < p && (x + 2) < n) data[x + 2] = 0;
        if (reinterpret_cast<float*>(&vals)[3] < p && (x + 3) < n) data[x + 3] = 0;
    }
}