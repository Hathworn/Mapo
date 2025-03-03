; ModuleID = '../data/hip_kernels/10580/58/main.cu'
source_filename = "../data/hip_kernels/10580/58/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8__veccmpPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = load i32, i32 addrspace(1)* %0, align 4, !tbaa !4, !amdgpu.noclobber !8
  %5 = load i32, i32 addrspace(1)* %1, align 4, !tbaa !4, !amdgpu.noclobber !8
  %6 = tail call i32 asm "vset4.s32.s32.ne$0, $1.b0000, $2, $3;", "=r,r,r,r"(i32 %4, i32 %5, i32 0) #1, !srcloc !9
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 1
  store i32 %6, i32 addrspace(1)* %2, align 4, !tbaa !4
  %8 = tail call i32 asm "vset4.s32.s32.ne$0, $1.b1111, $2, $3;", "=r,r,r,r"(i32 %4, i32 %5, i32 0) #1, !srcloc !10
  %9 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 2
  store i32 %8, i32 addrspace(1)* %7, align 4, !tbaa !4
  %10 = tail call i32 asm "vset4.s32.s32.ne$0, $1.b2222, $2, $3;", "=r,r,r,r"(i32 %4, i32 %5, i32 0) #1, !srcloc !11
  %11 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 3
  store i32 %10, i32 addrspace(1)* %9, align 4, !tbaa !4
  %12 = tail call i32 asm "vset4.s32.s32.ne$0, $1.b3333, $2, $3;", "=r,r,r,r"(i32 %4, i32 %5, i32 0) #1, !srcloc !12
  store i32 %12, i32 addrspace(1)* %11, align 4, !tbaa !4
  ret void
}

attributes #0 = { argmemonly convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent nounwind readnone }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"int", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i64 7744747}
!10 = !{i64 7744849}
!11 = !{i64 7744951}
!12 = !{i64 7745053}
