#include "hip/hip_runtime.h"
#include "includes.h"
#define MAX_STEPS 32

void readFile();
int cpuPathTest(int limitSteps, unsigned long long *tid);
void printMaze();
void printPath(unsigned long long tid, int steps);
void printPathMaze(unsigned long long tid, int steps);
void setTime0();
void getExeTime();

struct Maze {
    char maze[99][99];
    int rows, cols, s_x, s_y, e_x, e_y;
};

struct Maze maze;
FILE *MAZE;
struct timespec t_start, t_end;
double elapsedTime;

const int threadsPerBlock = 1024;
const int blocksPerGrid = 1024;

__global__ void testPath(int *limitSteps, struct Maze *maze, int *workDone, unsigned long long *path) {
    unsigned long long tid = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned long long bias = blockDim.x * gridDim.x;
    unsigned long long maxRoute = 0xffffffffffffffff - (bias - 1);
    maxRoute >>= (MAX_STEPS - *limitSteps) * 2;

    while (tid <= maxRoute) {
        if (*workDone) break;

        int x = maze->s_x, y = maze->s_y;
        unsigned long long temp = tid;
        int steps = 0;
        int i = *limitSteps;

        // Use unsigned 'direction' instead of int for optimization
        unsigned direction;
        do {
            // Extract and shift only once per iteration
            direction = temp & 3; // Utilize register for better performance
            temp >>= 2;
            steps++;

            // Use a lookup table for direction increments to improve branch prediction
            const int dx[4] = {1, 0, -1, 0};
            const int dy[4] = {0, -1, 0, 1};
            x += dx[direction];
            y += dy[direction];

            // Check target condition and maze boundary in one conditional
            if (maze->maze[y][x] == '$') {
                atomicExch(workDone, 1); // Use atomic to update shared 'workDone'
                atomicExch(path, tid); // Similarly, atomic exchange for path
                break;
            } else if (maze->maze[y][x] != '.') {
                break;
            }
        } while (--i);

        tid += bias;
    }
}