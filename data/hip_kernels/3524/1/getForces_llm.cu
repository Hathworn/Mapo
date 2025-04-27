#include "hip/hip_runtime.h"
#include "includes.h"

#define NR_NEUTRONS 8
#define NR_ELECTRONS 8
#define NR_PROTONS 8

#define MASS_PROTON 1.007276
#define MASS_NEUTRON 1.008664
#define MASS_ELECTRON 5.485799e-4

#define BLOCK 256

#define XWindowSize 2500
#define YWindowSize 2500

#define DRAW 10
#define DAMP 1.0

#define DT 0.001
#define STOP_TIME 10.0

#define G 6.67408E-11
#define H 1.0

#define EYE 8.5
#define FAR 80.0

#define SHAPE_CT 24
#define SHAPE_SIZE 256
#define PATH "./objects/Tokamak_256.obj"
#define N 16*16*16

float4 *p;
float3 *v, *f, *reactor,*r_GPU0, *r_GPU1;
float4 *p_GPU0, *p_GPU1;

__device__ float3 getBodyBodyForce(float4 p0, float4 p1){
    float3 f;
    float dx = p1.x - p0.x;
    float dy = p1.y - p0.y;
    float dz = p1.z - p0.z;
    float r2 = dx*dx + dy*dy + dz*dz;
    float inv_r = 1/sqrt(r2);

    float force  = (G*p0.w*p1.w)/(r2);

    f.x = force*dx*inv_r;
    f.y = force*dy*inv_r;
    f.z = force*dz*inv_r;

    return(f);
}

__global__ void getForces(float4 *g_pos, float3 *force, int offset, int device_ct){
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    float3 forceSum = make_float3(0.0f, 0.0f, 0.0f);
    float4 posMe = g_pos[id + offset];

    __shared__ float4 shPos[BLOCK];

    // Iterate through grids and calculate forces
    for (int j = 0; j < gridDim.x * device_ct; j++) {
        // Load positions to shared memory
        if (threadIdx.x < BLOCK) {
            shPos[threadIdx.x] = g_pos[threadIdx.x + blockDim.x * j];
        }
        __syncthreads();

        // Unroll the loop to improve performance
        #pragma unroll 32
        for (int i = 0; i < blockDim.x; i++) {
            int ii = i + blockDim.x * j;
            if (ii != id + offset && ii < N) {
                float3 force_b2b = getBodyBodyForce(posMe, shPos[i]);
                forceSum.x += force_b2b.x;
                forceSum.y += force_b2b.y;
                forceSum.z += force_b2b.z;
            }
        }
        __syncthreads();
    }

    // Write the computed forces for each particle
    if (id < N){
        force[id] = forceSum;
    }
}