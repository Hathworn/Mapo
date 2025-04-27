#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerFtCalcForcesRes(unsigned ftcount, bool simulate2d, double dt, const float3 *ftoomega, const float3 *ftovel, const double3 *ftocenter, const float3 *ftoforces, float3 *ftoforcesres, double3 *ftocenterres) {
    const unsigned cf = blockIdx.x * blockDim.x + threadIdx.x;
    if (cf < ftcount) {
        // Load inputs from global memory once.
        float3 fomega = ftoomega[cf];
        float3 fvel = ftovel[cf];
        float3 face = ftoforces[cf * 2];
        float3 omegaace = ftoforces[cf * 2 + 1];
        double3 fcenter = ftocenter[cf];

        // Update omega using FMA for better precision and performance.
        fomega.x = fma(dt, omegaace.x, fomega.x);
        fomega.y = fma(dt, omegaace.y, fomega.y);
        fomega.z = fma(dt, omegaace.z, fomega.z);

        if (simulate2d) {
            // Zero out specific components for 2D simulation.
            face.y = 0;
            fomega.x = 0;
            fomega.z = 0;
            fvel.y = 0;
        }

        // Update center using FMA.
        fcenter.x = fma(dt, fvel.x, fcenter.x);
        fcenter.y = fma(dt, fvel.y, fcenter.y);
        fcenter.z = fma(dt, fvel.z, fcenter.z);

        // Update velocity using FMA.
        fvel.x = fma(dt, face.x, fvel.x);
        fvel.y = fma(dt, face.y, fvel.y);
        fvel.z = fma(dt, face.z, fvel.z);

        // Store the updated results back to global memory.
        ftoforcesres[cf * 2] = fomega;
        ftoforcesres[cf * 2 + 1] = fvel;
        ftocenterres[cf] = fcenter;
    }
}