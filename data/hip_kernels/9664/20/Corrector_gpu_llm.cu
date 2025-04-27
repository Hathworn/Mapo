#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Corrector_gpu(double GTIME, double *local_time, double *step, int *next, unsigned long nextsize, double4 *pos_CH, double4 *vel_CH, double4 *a_tot_D, double4 *a1_tot_D, double4 *a2_tot_D, double4 *a_H0, double4 *a3_H, double ETA6, double ETA4, double DTMAX, double DTMIN, unsigned int N) {

    unsigned int gtid = blockIdx.x * blockDim.x + threadIdx.x;

    if (gtid >= nextsize) return;  // Return early if thread ID is out of bounds

    // Load and precompute constants
    const int who = next[gtid];
    const int who1 = gtid + nextsize;
    const int who2 = who1 + nextsize;

    double h = GTIME - local_time[who];
    local_time[who] = GTIME;

    const double h1 = 0.5 * h;
    const double h2 = h1 * h1;
    const double h3 = 0.75 / (h1 * h1 * h1);
    const double h4 = 1.5 / (h2 * h2);
    const double h5 = 7.5 / (h2 * h2 * h1);
    const double over = 1.0 / 15.0;

    // Common calculations for each component
    for (int i = 0; i < 3; i++) {
        // Calculate magnitudes
        a_H0[gtid].w = a_H0[gtid][i] * a_H0[gtid][i] + a_H0[gtid][(i+1)%3] * a_H0[gtid][(i+1)%3] + a_H0[gtid][(i+2)%3] * a_H0[gtid][(i+2)%3];
        a_H0[who1].w = a_H0[who1][i] * a_H0[who1][i] + a_H0[who1][(i+1)%3] * a_H0[who1][(i+1)%3] + a_H0[who1][(i+2)%3] * a_H0[who1][(i+2)%3];
        a_H0[who2].w = a_H0[who2][i] * a_H0[who2][i] + a_H0[who2][(i+1)%3] * a_H0[who2][(i+1)%3] + a_H0[who2][(i+2)%3] * a_H0[who2][(i+2)%3];

        double Amin = a_H0[gtid][i] - a_tot_D[who][i];
        double Aplu = a_H0[gtid][i] + a_tot_D[who][i];
        double Jmin = h1 * (a_H0[who1][i] - a1_tot_D[who][i]);
        double Jplu = h1 * (a_H0[who1][i] + a1_tot_D[who][i]);
        double Smin = h1 * h1 * (a_H0[who2][i] - a2_tot_D[who][i]);
        double Splu = h1 * h1 * (a_H0[who2][i] + a2_tot_D[who][i]);

        pos_CH[who][i] += h1 * vel_CH[who][i] - 0.4 * h2 * Amin + over * h2 * Jplu;
        vel_CH[who][i] += h1 * Aplu - 0.4 * h1 * Jmin + over * h1 * Splu;
        pos_CH[who][i] += h1 * vel_CH[who][i];

        a3_H[who][i] = h3 * (-5.0 * Amin + 5.0 * Jplu - Smin);
        double a4half = h4 * (-Jmin + Splu);
        double a5half = h5 * (3.0 * Amin - 3.0 * Jplu + Smin);
        a3_H[who][i] += h1 * a4half + 0.5 * h2 * a5half;
        a4half += h1 * a5half;

        if (i == 0) {
            a3_H[who].w = sqrt(a3_H[who][0] * a3_H[who][0] + a3_H[who][1] * a3_H[who][1] + a3_H[who][2] * a3_H[who][2]);
            double a4mod = sqrt(a4half * a4half + a4half * a4half + a4half * a4half);
            double a5mod = sqrt(a5half * a5half + a5half * a5half + a5half * a5half);

            double dt6 = (sqrt(a_H0[gtid].w * a_H0[who2].w) + a_H0[who1].w) / (a5mod * a3_H[who].w + a4mod * a4mod);
            dt6 = ETA6 * pow(dt6, 1.0 / 6.0);

            double stp = h;
            double overh3 = 1.0 / (stp * stp * stp);
            double overh2 = 1.0 / (stp * stp);

            double a2d[3], a3d[3];
            for (int j = 0; j < 3; j++) {
                a2d[j] = overh2 * (-6.0 * (a_tot_D[who][j] - a_H0[gtid][j]) - stp * (4.0 * a_H0[who1][j] + 2.0 * a1_tot_D[who][j]));
                a3d[j] = overh3 * (12.0 * (a_tot_D[who][j] - a_H0[gtid][j]) + 6.0 * stp * (a_H0[who1][j] + a1_tot_D[who][j]));
                a2d[j] += h * a3d[j];
            }

            a_H0[who2].w = a2d[0] * a2d[0] + a2d[1] * a2d[1] + a2d[2] * a2d[2];
            a3_H[who].w = a3d[0] * a3d[0] + a3d[1] * a3d[1] + a3d[2] * a3d[2];

            double dt4 = sqrt(ETA4 * (sqrt(a_H0[gtid].w * a_H0[who2].w) + a_H0[who1].w) / (sqrt(a_H0[who1].w * a3_H[who].w) + a_H0[who2].w));

            double dt = 0.5 * dt4 + 0.5 * dt6;

            double rest = GTIME / (2.0 * step[who]);
            rest = (double)((int)(rest)) - rest;

            if (dt > 2.0 * step[who] && rest == 0.0 && 2.0 * step[who] <= DTMAX)
                step[who] *= 2.0;
            else if (dt < 0.5 * step[who])
                step[who] *= 0.25;
            else if (dt < step[who])
                step[who] *= 0.5;

            if (step[who] < DTMIN)
                step[who] = DTMIN;

            a_tot_D[who] = a_H0[gtid];
            a1_tot_D[who] = a_H0[who1];
            a2_tot_D[who] = a_H0[who2];
        }
    }
}