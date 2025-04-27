#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void gaussdensity_direct_alt(int natoms, const float4 *xyzr, float gridspacing, unsigned int z, float *densitygrid) {
    unsigned int xindex = (blockIdx.x * blockDim.x) * DUNROLLX + threadIdx.x;
    unsigned int yindex = (blockIdx.y * blockDim.y) + threadIdx.y;
    unsigned int zindex = (blockIdx.z * blockDim.z) + threadIdx.z;
    unsigned int outaddr =
            ((gridDim.x * blockDim.x) * DUNROLLX) * (gridDim.y * blockDim.y) * zindex +
            ((gridDim.x * blockDim.x) * DUNROLLX) * yindex + xindex;
    zindex += z;

    float coorx = gridspacing * xindex;
    float coory = gridspacing * yindex;
    float coorz = gridspacing * zindex;

    // Initialize density values using unroll factor
    float densityval[DUNROLLX] = {0};

    float gridspacing_coalesce = gridspacing * DBLOCKSZX;

    for (int atomid = 0; atomid < natoms; atomid++) {
        float4 atom = xyzr[atomid];
        float dy = coory - atom.y;
        float dz = coorz - atom.z;
        float dyz2 = dy * dy + dz * dz;

        // Loop to calculate density values for each unroll position
        for (int i = 0; i < DUNROLLX; ++i) {
            float dx = coorx + i * gridspacing_coalesce - atom.x;
            float r2 = (dx * dx + dyz2) * atom.w;
            densityval[i] += exp2f(-r2);
        }
    }

    // Write results to global memory
    for (int i = 0; i < DUNROLLX; ++i) {
        densitygrid[outaddr + i * DBLOCKSZX] += densityval[i];
    }
}