#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

#define D 3
#define N 200
#define K 512
#define Nt 20
#define Rt 0.1f
#define c 0.001f
#define ct 0.0001f

__global__ void addcuda(float* Q, float* P, float* Qt, float* Pt, float* Eg, float* Epg) {
    int x = blockIdx.x;
    int y = threadIdx.x;
    int i = x * K * D + y * D;

    // Load position values
    float Qx = Q[i];
    float Qy = Q[i + 1];
    float Qz = Q[i + 2];

    // Load momentum values
    float Px = P[i];
    float Py = P[i + 1];
    float Pz = P[i + 2];
    
    // Load energy values
    float E = Eg[i / 3];
    float Ep = Epg[i / 3];

    // Calculate new position
    float nQx = Qx + c * Px;
    float nQy = Qy + c * Py;
    float nQz = Qz + c * Pz;

    // Reflect from boundaries
    if ((nQx > 1.0f) || (nQx < 0.0f)) Px = -Px;
    if ((nQy > 1.0f) || (nQy < 0.0f)) Py = -Py;
    if ((nQz > 1.0f) || (nQz < 0.0f)) Pz = -Pz;

    // Reflect from turbulences
    for (int nt = 0; nt < Nt; nt++) {
        float QtX = Qt[nt];
        float QtY = Qt[nt + 1];
        float QtZ = Qt[nt + 2];

        float Range = sqrtf(powf(Qx - QtX, 2) + powf(Qy - QtY, 2) + powf(Qz - QtZ, 2));
        float nRange = sqrtf(powf(nQx - QtX, 2) + powf(nQy - QtY, 2) + powf(nQz - QtZ, 2));

        if ((Range > Rt) && (nRange < Rt)) {
            float DirX = (nQx - QtX) / Range;
            float DirY = (nQy - QtY) / Range;
            float DirZ = (nQz - QtZ) / Range;
            float PnormKoe = Px * DirX + Py * DirY + Pz * DirZ;
            float Pnormt = Pt[nt] * DirX + Pt[nt + 1] * DirY + Pt[nt + 2] * DirZ;
            E -= (ct / c) * PnormKoe * PnormKoe * Pnormt * fabs(Pnormt);
            Px -= 2.0f * DirX;
            Py -= 2.0f * DirY;
            Pz -= 2.0f * DirZ;
        }
    }

    // Particle behavior and energy adjustment
    if ((nQz > 1.0f) && (E > Ep)) E = 100.0f;
    if (nQz > 0.5f) E -= 0.0001f;
    if (((nQz > 0.5f) && (Qz < 0.5f)) || ((Qz > 0.5f) && (nQz < 0.5f))) E += 1.0f;

    // Write back to memory
    Q[i] = nQx;
    Q[i + 1] = nQy;
    Q[i + 2] = nQz;

    P[i] = Px;
    P[i + 1] = Py;
    P[i + 2] = Pz;
    Eg[i / 3] = E;
}