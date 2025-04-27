#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CycleRoutineGPU(char *CurrentState, char *NextState, int X, int Dimension) {
    int sum = 0;
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    if (id < Dimension) {
        int idPlusX = id + X;
        int idMinusX = id - X;
        int row = id / X;

        // Simplified boundary conditions
        if (idPlusX < Dimension) sum += CurrentState[idPlusX]; // Down
        if (idMinusX >= 0) sum += CurrentState[idMinusX];      // Up
        if (id % X != X - 1) sum += CurrentState[id + 1];      // Right
        if (id % X != 0) sum += CurrentState[id - 1];          // Left

        // Diagonal checks within the same row boundary
        if (idPlusX < Dimension && (idPlusX % X) != X - 1) sum += CurrentState[idPlusX + 1]; // Down-Right
        if (idPlusX < Dimension && (idPlusX % X) != 0) sum += CurrentState[idPlusX - 1];     // Down-Left
        if (idMinusX >= 0 && (idMinusX % X) != X - 1) sum += CurrentState[idMinusX + 1];     // Up-Right
        if (idMinusX >= 0 && (idMinusX % X) != 0) sum += CurrentState[idMinusX - 1];         // Up-Left

        // State transition
        if (sum < 2 || sum > 3)
            NextState[id] = 0;
        else if (sum == 3)
            NextState[id] = 1;
        else
            NextState[id] = CurrentState[id];
    }
}