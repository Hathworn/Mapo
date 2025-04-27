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

// Globals
float4 *p;
float3 *v, *f, *reactor,*r_GPU0, *r_GPU1;
float4 *p_GPU0, *p_GPU1;

__global__ void moveBodies(float4 *g_pos, float4 *d_pos, float3 *vel, float3 *force, int offset) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;
    if (id < N) {
        float inv_mass = 1.0f / d_pos[id].w;
        float damped_vel_x = vel[id].x * DAMP;
        float damped_vel_y = vel[id].y * DAMP;
        float damped_vel_z = vel[id].z * DAMP;

        // Update velocity using precomputed inverse mass and damped velocity
        vel[id].x = vel[id].x + ((force[id].x - damped_vel_x) * inv_mass) * DT;
        vel[id].y = vel[id].y + ((force[id].y - damped_vel_y) * inv_mass) * DT;
        vel[id].z = vel[id].z + ((force[id].z - damped_vel_z) * inv_mass) * DT;

        // Update positions
        d_pos[id].x += vel[id].x * DT;
        d_pos[id].y += vel[id].y * DT;
        d_pos[id].z += vel[id].z * DT;

        // Store updated positions in global memory
        g_pos[id + offset].x = d_pos[id].x;
        g_pos[id + offset].y = d_pos[id].y;
        g_pos[id + offset].z = d_pos[id].z;
    }
}