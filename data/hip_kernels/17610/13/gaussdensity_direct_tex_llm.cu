#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void gaussdensity_direct_tex(int natoms, const float4 *xyzr, const float4 *colors, float gridspacing, unsigned int z, float *densitygrid, float3 *voltexmap, float invisovalue) {
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

    float densityvalx[DUNROLLX] = {0}; // Use array to eliminate redundant variables
    float3 densitycolx[DUNROLLX];
    for (int i = 0; i < DUNROLLX; i++) {
        densitycolx[i] = make_float3(0.0f, 0.0f, 0.0f);
    }

    float gridspacing_coalesce = gridspacing * DBLOCKSZX;

    int atomid;
    for (atomid = 0; atomid < natoms; atomid++) {
        float4 atom = xyzr[atomid];
        float4 color = colors[atomid];

        float dy = coory - atom.y;
        float dz = coorz - atom.z;
        float dyz2 = dy * dy + dz * dz;

        float dx[DUNROLLX];
        dx[0] = coorx - atom.x;
        for (int i = 1; i < DUNROLLX; i++) {
            dx[i] = dx[i - 1] + gridspacing_coalesce;
        }

        for (int i = 0; i < DUNROLLX; i++) {
            float r2 = (dx[i] * dx[i] + dyz2) * atom.w;
            float tmp = exp2f(-r2);
            densityvalx[i] += tmp;
            tmp *= invisovalue;
            densitycolx[i].x += tmp * color.x;
            densitycolx[i].y += tmp * color.y;
            densitycolx[i].z += tmp * color.z;
        }
    }

    for (int i = 0; i < DUNROLLX; i++) {
        densitygrid[outaddr + i * DBLOCKSZX] += densityvalx[i];
        voltexmap[outaddr + i * DBLOCKSZX].x += densitycolx[i].x;
        voltexmap[outaddr + i * DBLOCKSZX].y += densitycolx[i].y;
        voltexmap[outaddr + i * DBLOCKSZX].z += densitycolx[i].z;
    }
}