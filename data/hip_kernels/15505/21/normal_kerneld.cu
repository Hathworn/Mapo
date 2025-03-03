#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void normal_kerneld(int seed, double *data, int n, double mean, double std) {
if (threadIdx.x != 0) return;
hiprandState state;
hiprand_init(seed, 0, 0, &state);
for (size_t i(0); i < n; ++i)
data[i] = hiprand_normal_double(&state) * std + mean;
}