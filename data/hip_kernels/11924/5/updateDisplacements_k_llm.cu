#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void updateDisplacements_k(float4 *Ui_t, float4 *Ui_tminusdt, float *M, float4 *Ri, float4 *Fi, int maxNumForces, float4 *ABC, unsigned int numPoints)
{
    int me_idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (me_idx >= numPoints)
        return;

    float4 F = make_float4(0, 0, 0, 0);

    // Optimize force accumulation using registers
    #pragma unroll
    for (int i = 0; i < maxNumForces; i++)
    {
        float4 force_to_add = Fi[me_idx * maxNumForces + i];
        F.x += force_to_add.x;
        F.y += force_to_add.y;
        F.z += force_to_add.z;
    }

    // Minimize memory reads by utilizing registers
    float4 ABCi = ABC[me_idx];
    float4 Uit = Ui_t[me_idx];
    float4 Uitminusdt = Ui_tminusdt[me_idx];
    float4 R = Ri[me_idx];

    // Optimize calculations to a single line per component
    Ui_tminusdt[me_idx] = make_float4(
        ABCi.x * (R.x - F.x) + ABCi.y * Uit.x + ABCi.z * Uitminusdt.x,
        ABCi.x * (R.y - F.y) + ABCi.y * Uit.y + ABCi.z * Uitminusdt.y,
        ABCi.x * (R.z - F.z) + ABCi.y * Uit.z + ABCi.z * Uitminusdt.z,
        0
    );
}