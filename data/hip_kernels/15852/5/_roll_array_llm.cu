#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _roll_array(const float* __restrict__ array, const long* __restrict__ step, float* __restrict__ new_array, const int b, const int n, const int d) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index >= b * n * d)
        return;

    // Precompute constants and modulos
    const int nd = n * d;
    const int c_b = index / nd;
    const int c_n = (index % nd) / d;
    const int c_d = index % d;
    
    const int c_step = static_cast<int>(step[c_b]);
    const int new_n = (c_n + c_step + n) % n;
    const int position = new_n * d + c_d;
    
    // Directly assign the computed position
    new_array[c_b * nd + position] = array[index];
}