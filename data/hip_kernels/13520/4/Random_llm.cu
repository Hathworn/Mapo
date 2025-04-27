```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Random(float *results, long int n, unsigned int seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n) {  // Ensure idx is within bounds
        hiprandState_t state;
        hiprand_init(seed, idx, 0, &state);  // Use idx for unique sequence per thread
        results[idx] = (float)hiprand(&state) / 1000.0f;
    }
}