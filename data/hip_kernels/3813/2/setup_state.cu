#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
hiprand_init(seed, 0, 0, state);
}