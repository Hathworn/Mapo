; ModuleID = '../data/hip_kernels/11710/0/main.cu'
source_filename = "../data/hip_kernels/11710/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10addToKPlusiPdS_S_S_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = icmp slt i32 %6, %0
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = zext i32 %6 to i64
  %10 = getelementptr inbounds double, double addrspace(1)* %1, i64 %9
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !5, !amdgpu.noclobber !9
  %12 = getelementptr inbounds double, double addrspace(1)* %2, i64 %9
  %13 = load double, double addrspace(1)* %12, align 8, !tbaa !5, !amdgpu.noclobber !9
  %14 = fadd contract double %11, %13
  %15 = getelementptr inbounds double, double addrspace(1)* %3, i64 %9
  %16 = load double, double addrspace(1)* %15, align 8, !tbaa !5, !amdgpu.noclobber !9
  %17 = fadd contract double %14, %16
  %18 = getelementptr inbounds double, double addrspace(1)* %4, i64 %9
  store double %17, double addrspace(1)* %18, align 8, !tbaa !5
  br label %19

19:                                               ; preds = %8, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
