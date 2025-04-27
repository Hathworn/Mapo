#include "hip/hip_runtime.h"
#include "includes.h"

// Parameters

#define N_ATOMS 343
#define MASS_ATOM 1.0f
#define time_step 0.01f
#define L 10.5f
#define T 0.728f
#define NUM_STEPS 10000

const int BLOCK_SIZE = 1024;
const int scheme = 1; // 0 for explicit, 1 for implicit

/*************************************************************************************************************/
/*************								INITIALIZATION CODE										**********/
/*************************************************************************************************************/

__global__ void init_r(float* r, int N_cube) {
    // Calculate unique thread index within grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int plane_size = N_cube * N_cube; // Precompute plane size

    // Early return if out of bounds
    if (index >= N_ATOMS) return;

    // Calculate coordinates
    int iz = index / plane_size;
    int remainder = index % plane_size;
    int iy = remainder / N_cube;
    int ix = remainder % N_cube;

    // Compute positions based on grid indices
    r[index] = L / 2.0f * (1.0f - float(2 * ix + 1) / N_cube);
    r[index + N_ATOMS] = L / 2.0f * (1.0f - float(2 * iy + 1) / N_cube);
    r[index + 2 * N_ATOMS] = L / 2.0f * (1.0f - float(2 * iz + 1) / N_cube);
}