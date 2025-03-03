#include "hip/hip_runtime.h"
#include "includes.h"
// libs



__global__ void render_init(int mx, int my, hiprandState *randState, int seed) {
if (threadIdx.x == 0 && threadIdx.y == 0) {
hiprand_init(seed, 0, 0, randState);
}
int i = threadIdx.x + blockIdx.x * blockDim.x;
int j = threadIdx.y + blockIdx.y * blockDim.y;

if ((i >= mx) || (j >= my)) {
return;
}
int pixel_index = j * mx + i;
// same seed, different index
hiprand_init(seed + pixel_index, pixel_index, 0,
&randState[pixel_index]);
}