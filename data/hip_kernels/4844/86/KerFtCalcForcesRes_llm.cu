#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerFtCalcForcesRes(unsigned ftcount, bool simulate2d, double dt, const float3 *ftoomega, const float3 *ftovel, const double3 *ftocenter, const float3 *ftoforces, float3 *ftoforcesres, double3 *ftocenterres)
{
    const unsigned cf = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread only processes work within bounds
    if (cf < ftcount) {
        // Load fomega and compute with omegaace
        float3 fomega = ftoomega[cf];
        const float3 omegaace = ftoforces[cf * 2 + 1];
        fomega.x += dt * omegaace.x;
        fomega.y += dt * omegaace.y;
        fomega.z += dt * omegaace.z;

        // Load fvel and face
        float3 fvel = ftovel[cf];
        float3 face = ftoforces[cf * 2];

        // Apply 2D simulation constraints
        if (simulate2d) {
            face.y = 0;
            fomega.x = 0;
            fomega.z = 0;
            fvel.y = 0;
        }

        // Update fcenter using fvel
        double3 fcenter = ftocenter[cf];
        fcenter.x += dt * fvel.x;
        fcenter.y += dt * fvel.y;
        fcenter.z += dt * fvel.z;

        // Update fvel with face
        fvel.x += dt * face.x;
        fvel.y += dt * face.y;
        fvel.z += dt * face.z;

        // Output results
        ftoforcesres[cf * 2] = fomega;
        ftoforcesres[cf * 2 + 1] = fvel;
        ftocenterres[cf] = fcenter;
    }
}