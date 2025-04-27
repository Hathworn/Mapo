```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateDisplacements_k(float4 *Ui_t, float4 *Ui_tminusdt, float *M, float4 *Ri, float4 *Fi, int maxNumForces, float4 *ABC, unsigned int numPoints)
{
    int me_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (me_idx >= numPoints)
        return;

    float4 F = make_float4(0, 0, 0, 0);

    // Unroll the loop for efficiency
    for (int i = 0; i < maxNumForces; i += 4)
    {
        float4 force1 = Fi[me_idx * maxNumForces + i];
        float4 force2 = (i + 1 < maxNumForces) ? Fi[me_idx * maxNumForces + i + 1] : make_float4(0, 0, 0, 0);
        float4 force3 = (i + 2 < maxNumForces) ? Fi[me_idx * maxNumForces + i + 2] : make_float4(0, 0, 0, 0);
        float4 force4 = (i + 3 < maxNumForces) ? Fi[me_idx * maxNumForces + i + 3] : make_float4(0, 0, 0, 0);

        F.x += (force1.x + force2.x + force3.x + force4.x);
        F.y += (force1.y + force2.y + force3.y + force4.y);
        F.z += (force1.z + force2.z + force3.z + force4.z);
    }

    float4 ABCi = ABC[me_idx];
    float4 Uit = Ui_t[me_idx];
    float4 Uitminusdt = Ui_tminusdt[me_idx];

    float4 R = Ri[me_idx];
    float x = ABCi.x * (R.x - F.x) + ABCi.y * Uit.x + ABCi.z * Uitminusdt.x;
    float y = ABCi.x * (R.y - F.y) + ABCi.y * Uit.y + ABCi.z * Uitminusdt.y;
    float z = ABCi.x * (R.z - F.z) + ABCi.y * Uit.z + ABCi.z * Uitminusdt.z;

    Ui_tminusdt[me_idx] = make_float4(x, y, z, 0);
}