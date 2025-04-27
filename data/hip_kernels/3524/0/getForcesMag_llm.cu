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

__device__ float3 getMagForce(float4 p0, float3 v0, float3 dl_tail, float3 dl_head, float I){
    float3 dB, dl;
    dl.x = dl_head.x - dl_tail.x;
    dl.y = dl_head.y - dl_tail.y;
    dl.z = dl_head.z - dl_tail.z;

    float rx = p0.x - dl_tail.x;
    float ry = p0.y - dl_tail.y;
    float rz = p0.z - dl_tail.z;

    float r2 = rx*rx + ry*ry + rz*rz;
    float inv_r2 = 1 / r2;
    float inv_r = 1 / sqrtf(r2);
    float3 rhat = {rx * inv_r, ry * inv_r, rz * inv_r};

    float gamma = I;
    dB.x = gamma * (dl.y * rhat.z - dl.z * rhat.y) * inv_r2;
    dB.y = gamma * (dl.z * rhat.x - dl.x * rhat.z) * inv_r2;
    dB.z = gamma * (dl.x * rhat.y - dl.y * rhat.x) * inv_r2;

    return dB;
}

__global__ void getForcesMag(float4 *g_pos, float3 *vel, float3 *force, int offset, float3 *g_reactor){
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    if (id >= N) return; // Early exit if id is out of bounds

    float3 total_force = {0.0f, 0.0f, 0.0f};
    float3 B = {0.0f, 0.0f, 0.0f};
    float3 dB, dl_tail, dl_head;
    float4 posMe = g_pos[id + offset];
    float3 velMe = vel[id];
    
    __shared__ float3 shared_r[BLOCK];

    for (int k = 0; k < SHAPE_CT; k++) {
        if (threadIdx.x < SHAPE_SIZE) {  // Reduce shared memory usage
            shared_r[threadIdx.x] = g_reactor[threadIdx.x + blockDim.x * k];
        }
        __syncthreads();

        for (int j = 1; j <= SHAPE_SIZE; j++) {
            dl_tail = shared_r[(j - 1)];
            dl_head = shared_r[(j % SHAPE_SIZE)];
            dB = getMagForce(posMe, velMe, dl_tail, dl_head, 1.0);  // current[i] = 1

            B.x += dB.x;
            B.y += dB.y;
            B.z += dB.z;
        }
    }

    total_force.x = (velMe.y * B.z - velMe.z * B.y);
    total_force.y = (velMe.z * B.x - velMe.x * B.z);
    total_force.z = (velMe.x * B.y - velMe.y * B.x);

    force[id] = total_force;
}